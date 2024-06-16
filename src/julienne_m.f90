module julienne_m
  use julienne_command_line_m, only : command_line_t
  use julienne_formats_m, only : separated_values
  use julienne_string_m, only : string_t, operator(.cat.)
  use julienne_test_m, only : test_t, test_description_substring
  use julienne_test_description_m, only : test_description_t, test_function_i
  use julienne_test_result_m, only : test_result_t
  use julienne_vector_test_description_m, only : vector_test_description_t, vector_function_strategy_t

  implicit none
  private
  public :: command_line_t
  public :: operator(.cat.)
  public :: separated_values
  public :: string_t
  public :: test_t
  public :: test_description_t
  public :: test_description_substring
  public :: test_function_i
  public :: test_result_t
  public :: vector_function_strategy_t
  public :: vector_test_description_t
end module julienne_m

  !"___julienne_formats_m_MOD_separated_values_1d", referenced from:
  !    ___formats_test_m_MOD_check_new_line_separated_integers in test_formats_test.F90.o
  !    ___formats_test_m_MOD_check_csv_character in test_formats_test.F90.o
  !    ___formats_test_m_MOD_check_space_separated_complex in test_formats_test.F90.o
  !    ___formats_test_m_MOD_check_csv_reals in test_formats_test.F90.o
