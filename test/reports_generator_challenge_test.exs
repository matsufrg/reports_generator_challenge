defmodule ReportsGeneratorChallengeTest do
  use ExUnit.Case
  doctest ReportsGeneratorChallenge

  describe "build/1" do
    test "When a file is provided, returns the report" do
      filename = "gen_report_test.csv"

      response = ReportsGeneratorChallenge.build(filename)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 19,
          "Daniele" => 21,
          "Danilo" => 7,
          "Diego" => 13,
          "Giuliano" => 14,
          "Jakeliny" => 25,
          "Joseph" => 17,
          "Mayk" => 33,
          "Rafael" => 14,
          "Vinicius" => 0
        },
        "hours_per_month" => %{
          "Cleiton" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 4,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 8,
            "setembro" => 0
          },
          "Daniele" => %{
            "abril" => 7,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 1,
            "maio" => 8,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Danilo" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 6,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Diego" => %{
            "abril" => 4,
            "agosto" => 4,
            "dezembro" => 1,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 1,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 3
          },
          "Giuliano" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 9,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 4,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Jakeliny" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 1,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 8,
            "junho" => 0,
            "maio" => 0,
            "março" => 14,
            "novembro" => 0,
            "outubro" => 2,
            "setembro" => 0
          },
          "Joseph" => %{
            "abril" => 4,
            "agosto" => 0,
            "dezembro" => 2,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 3,
            "novembro" => 5,
            "outubro" => 0,
            "setembro" => 3
          },
          "Mayk" => %{
            "abril" => 4,
            "agosto" => 0,
            "dezembro" => 5,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 3,
            "maio" => 0,
            "março" => 3,
            "novembro" => 4,
            "outubro" => 0,
            "setembro" => 7
          },
          "Rafael" => %{
            "abril" => 0,
            "agosto" => 7,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "Vinicius" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        "hours_per_year" => %{
          "Cleiton" => %{
            2016 => 3,
            2017 => 0,
            2018 => 7,
            2019 => 0,
            2020 => 9
          },
          "Daniele" => %{
            2016 => 10,
            2017 => 3,
            2018 => 7,
            2019 => 0,
            2020 => 1
          },
          "Danilo" => %{
            2016 => 0,
            2017 => 0,
            2018 => 1,
            2019 => 6,
            2020 => 0
          },
          "Diego" => %{
            2016 => 3,
            2017 => 8,
            2018 => 1,
            2019 => 1,
            2020 => 0
          },
          "Giuliano" => %{
            2016 => 0,
            2017 => 3,
            2018 => 0,
            2019 => 6,
            2020 => 5
          },
          "Jakeliny" => %{
            2016 => 8,
            2017 => 8,
            2018 => 0,
            2019 => 7,
            2020 => 2
          },
          "Joseph" => %{
            2016 => 0,
            2017 => 3,
            2018 => 0,
            2019 => 3,
            2020 => 11
          },
          "Mayk" => %{
            2016 => 11,
            2017 => 8,
            2018 => 0,
            2019 => 7,
            2020 => 7
          },
          "Rafael" => %{
            2016 => 0,
            2017 => 14,
            2018 => 0,
            2019 => 0,
            2020 => 0
          },
          "Vinicius" => %{
            2016 => 0,
            2017 => 0,
            2018 => 0,
            2019 => 0,
            2020 => 0
          }
        }
      }

      assert expected_response == response
    end
  end

  describe "build_from_many/1" do
    test "When a list is provided, returns the report" do
      filenames = ["gen_report_test.csv", "gen_report_test.csv"]

      response = ReportsGeneratorChallenge.build_from_many(filenames)

      expected_response =
        {:ok,
         %{
           "all_hours" => %{
             "Cleiton" => 38,
             "Daniele" => 42,
             "Danilo" => 14,
             "Diego" => 26,
             "Giuliano" => 28,
             "Jakeliny" => 50,
             "Joseph" => 34,
             "Mayk" => 66,
             "Rafael" => 28,
             "Vinicius" => 0
           },
           "hours_per_month" => %{
             "Cleiton" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 14,
               "junho" => 8,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 16,
               "setembro" => 0
             },
             "Daniele" => %{
               "abril" => 14,
               "agosto" => 0,
               "dezembro" => 10,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 2,
               "maio" => 16,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Danilo" => %{
               "abril" => 2,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 12,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Diego" => %{
               "abril" => 8,
               "agosto" => 8,
               "dezembro" => 2,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 2,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 6
             },
             "Giuliano" => %{
               "abril" => 2,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 18,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 8,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Jakeliny" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 2,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 16,
               "junho" => 0,
               "maio" => 0,
               "março" => 28,
               "novembro" => 0,
               "outubro" => 4,
               "setembro" => 0
             },
             "Joseph" => %{
               "abril" => 8,
               "agosto" => 0,
               "dezembro" => 4,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 0,
               "março" => 6,
               "novembro" => 10,
               "outubro" => 0,
               "setembro" => 6
             },
             "Mayk" => %{
               "abril" => 8,
               "agosto" => 0,
               "dezembro" => 10,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 14,
               "junho" => 6,
               "maio" => 0,
               "março" => 6,
               "novembro" => 8,
               "outubro" => 0,
               "setembro" => 14
             },
             "Rafael" => %{
               "abril" => 0,
               "agosto" => 14,
               "dezembro" => 0,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 14,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             },
             "Vinicius" => %{
               "abril" => 0,
               "agosto" => 0,
               "dezembro" => 0,
               "fevereiro" => 0,
               "janeiro" => 0,
               "julho" => 0,
               "junho" => 0,
               "maio" => 0,
               "março" => 0,
               "novembro" => 0,
               "outubro" => 0,
               "setembro" => 0
             }
           },
           "hours_per_year" => %{
             "Cleiton" => %{
               2016 => 6,
               2017 => 0,
               2018 => 14,
               2019 => 0,
               2020 => 18
             },
             "Daniele" => %{
               2016 => 20,
               2017 => 6,
               2018 => 14,
               2019 => 0,
               2020 => 2
             },
             "Danilo" => %{
               2016 => 0,
               2017 => 0,
               2018 => 2,
               2019 => 12,
               2020 => 0
             },
             "Diego" => %{
               2016 => 6,
               2017 => 16,
               2018 => 2,
               2019 => 2,
               2020 => 0
             },
             "Giuliano" => %{
               2016 => 0,
               2017 => 6,
               2018 => 0,
               2019 => 12,
               2020 => 10
             },
             "Jakeliny" => %{
               2016 => 16,
               2017 => 16,
               2018 => 0,
               2019 => 14,
               2020 => 4
             },
             "Joseph" => %{
               2016 => 0,
               2017 => 6,
               2018 => 0,
               2019 => 6,
               2020 => 22
             },
             "Mayk" => %{
               2016 => 22,
               2017 => 16,
               2018 => 0,
               2019 => 14,
               2020 => 14
             },
             "Rafael" => %{
               2016 => 0,
               2017 => 28,
               2018 => 0,
               2019 => 0,
               2020 => 0
             },
             "Vinicius" => %{
               2016 => 0,
               2017 => 0,
               2018 => 0,
               2019 => 0,
               2020 => 0
             }
           }
         }}

      assert expected_response == response
    end

    test "When an list is not provided, returns the error" do
      filenames = "Test"

      response = ReportsGeneratorChallenge.build_from_many(filenames)

      expected_response = {:error, "Please, provide a list"}

      assert expected_response == response
    end
  end
end
