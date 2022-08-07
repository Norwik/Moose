# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Context.ClientContextTest do
  @moduledoc """
  Client Context Test Cases
  """
  use Orangutan.DataCase
  alias Orangutan.Context.ClientContext, as: ClientContext

  describe "client_context" do
    test "new_client/1 test cases" do
      client =
        ClientContext.new_client(%{
          age: 30,
          country: "netherlands",
          gender: "male",
          state: "amsterdam",
          username: "admin",
          user_id: nil
        })

      assert client.age == 30
    end
  end
end
