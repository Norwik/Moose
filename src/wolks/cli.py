# MIT License
#
# Copyright (c) 2022 Clivern
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import argparse
import logging
import sys
import asyncore
import socket

from wolks import __version__
from .mail_server import handle_signals, MailServer


__author__ = "Clivern"
__copyright__ = "Clivern"
__license__ = "MIT"

_logger = logging.getLogger(__name__)


def parse_args(args):
    """Parse command line parameters

    Args:
      args (List[str]): command line parameters as list of strings
          (for example  ``["--help"]``).

    Returns:
      :obj:`argparse.Namespace`: command line parameters namespace
    """
    parser = argparse.ArgumentParser(description="A Fake SMTP Server in Python")

    parser.add_argument(
        "--version",
        action="version",
        version="Wolks {ver}".format(ver=__version__),
    )

    parser.add_argument(
        "--host",
        dest="host",
        help="The hostname",
        type=str,
        metavar="STR",
        default="localhost",
    )

    parser.add_argument(
        "--port",
        dest="port",
        help="The port number",
        type=int,
        metavar="INT",
        default=25,
    )

    parser.add_argument(
        "--path",
        dest="path",
        help="The path",
        type=str,
        metavar="STR",
        default="./",
    )

    parser.add_argument(
        "-v",
        "--verbose",
        dest="loglevel",
        help="set loglevel to INFO",
        action="store_const",
        const=logging.INFO,
    )

    parser.add_argument(
        "-vv",
        "--very-verbose",
        dest="loglevel",
        help="set loglevel to DEBUG",
        action="store_const",
        const=logging.DEBUG,
    )

    return parser.parse_args(args)


def setup_logging(loglevel):
    """
    Setup basic logging

    Args:
      loglevel (int): minimum loglevel for emitting messages
    """
    logformat = "[%(asctime)s] %(levelname)s:%(name)s:%(message)s"
    logging.basicConfig(
        level=loglevel, stream=sys.stdout, format=logformat, datefmt="%Y-%m-%d %H:%M:%S"
    )


def main(args):
    args = parse_args(args)
    setup_logging(args.loglevel)

    _logger.info("Start wolks on host {} and port {} and path {}".format(
        args.host,
        args.port,
        args.path
    ))

    handle_signals()

    try:
        server = MailServer((args.host, args.port), None, args.path)
    except Exception as e:
        _logger.error("Error while starting server {}".format(str(e)))
        sys.exit()

    _logger.info("Listening on host {} and port {}".format(
        args.host,
        args.port
    ))

    try:
        asyncore.loop()
    except KeyboardInterrupt:
        sys.exit()


def run():
    main(sys.argv[1:])


if __name__ == "__main__":
    run()
