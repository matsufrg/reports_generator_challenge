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

  def user_list(param) do
    Enum.into(@available_names, %{}, &{&1, param})
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
