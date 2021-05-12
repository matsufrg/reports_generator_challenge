defmodule ReportsGeneratorChallenge do
  alias ReportsGeneratorChallenge.Parser

  @available_names [
    "Cleiton",
    "Daniele",
    "Danilo",
    "Diego",
    "Giuliano",
    "Jakeliny",
    "Joseph",
    "Mayk",
    "Rafael",
    "Vinicius"
  ]

  @available_months [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  def build(filename) do
    "reports/#{filename}"
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn list, acc -> sum_values(list, acc) end)
  end

  def build_from_many(filenames) when not is_list(filenames) do
    {:error, "Please, provide a list"}
  end

  def build_from_many(filenames) do
    result =
      filenames
      |> Task.async_stream(&build/1)
      |> Enum.reduce(report_acc(), fn {:ok, list}, acc ->
        sum_many_values(list, acc)
      end)

    {:ok, result}
  end

  defp sum_many_values(
         %{
           "all_hours" => all_hours1,
           "hours_per_month" => hours_per_month1,
           "hours_per_year" => hours_per_year1
         },
         %{
           "all_hours" => all_hours2,
           "hours_per_month" => hours_per_month2,
           "hours_per_year" => hours_per_year2
         }
       ) do
    all_hours = Map.merge(all_hours1, all_hours2, fn _k, v1, v2 -> v1 + v2 end)

    hours_per_month = sum_maps(hours_per_month1, hours_per_month2)

    hours_per_year = sum_maps(hours_per_year1, hours_per_year2)

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp sum_maps(map1, map2) when is_map(map1) and is_map(map2) do
    Map.merge(map1, map2, fn _k, v1, v2 ->
      sum_maps(v1, v2)
    end)
  end

  defp sum_maps(val1, val2) do
    val1 + val2
  end

  defp sum_values([name, hours, _day, month, year], %{
         "all_hours" => all_hours,
         "hours_per_month" => hours_per_month,
         "hours_per_year" => hours_per_year
       }) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hours)

    current_month = Enum.at(@available_months, month - 1)

    hours_per_year =
      update_in(
        hours_per_year,
        [name, year],
        &(&1 + hours)
      )

    hours_per_month =
      update_in(
        hours_per_month,
        [name, current_month],
        &(&1 + hours)
      )

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp user_list(param) do
    Enum.into(@available_names, %{}, &{&1, param})
  end

  def report_acc() do
    users = user_list(0)

    month = Enum.into(@available_months, %{}, &{&1, 0})
    hours_per_month = user_list(month)

    year = Enum.into([2016, 2017, 2018, 2019, 2020], %{}, &{&1, 0})
    hours_per_year = user_list(year)

    %{
      "all_hours" => users,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
