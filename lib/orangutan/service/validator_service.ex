# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Service.ValidatorService do
  @moduledoc """
  Validator Service Module
  """

  @doc """
  Check if a value is an integer
  """
  def validate_int(value) do
    case is_integer(value) do
      true ->
        true

      false ->
        try do
          _ = String.to_integer(value)
          true
        rescue
          _ -> false
        end
    end
  end

  @doc """
  Convert a value into an integer
  """
  def parse_int(value) do
    case is_integer(value) do
      true ->
        value

      false ->
        String.to_integer(value)
    end
  end

  @doc """
  Check if value is empty or not
  """
  def is_empty(value) do
    case is_integer(value) do
      true ->
        String.trim(to_string(value)) == ""

      false ->
        String.trim(value) == ""
    end
  end
end
