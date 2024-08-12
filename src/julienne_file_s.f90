submodule(julienne_file_m) julienne_file_s
  use iso_fortran_env, only : iostat_end, iostat_eor, output_unit
  use assert_m, only : assert
  implicit none

contains

  module procedure from_string_array
    file_object%lines_ = lines
  end procedure

  module procedure lines
    my_lines = self%lines_
  end procedure

  module procedure write_lines

    integer file_unit, io_status, l

    call assert(allocated(self%lines_), "file_t%write_lines: allocated(self%lines_)")

    if (present(file_name)) then
      open(newunit=file_unit, file=file_name%string(), form='formatted', status='unknown', iostat=io_status, action='write')
      call assert(io_status==0,"write_lines: io_status==0 after 'open' statement", file_name%string())
    else
      file_unit = output_unit
    end if

    do l = 1, size(self%lines_)
      write(file_unit, *) self%lines_(l)%string()
    end do

    if (present(file_name)) close(file_unit)
  end procedure
  
  module procedure from_file_with_character_name
    file_object = from_file_with_string_name(string_t(file_name))
  end procedure

  module procedure from_file_with_string_name

    integer io_status, file_unit, line_num
    character(len=:), allocatable :: line
    integer, parameter :: max_message_length=128
    character(len=max_message_length) error_message
    integer, allocatable :: lengths(:)

    open(newunit=file_unit, file=file_name%string(), form='formatted', status='old', iostat=io_status, action='read')
    call assert(io_status==0,"from_file_with_string_name: io_status==0 after 'open' statement", file_name%string())

    lengths = line_lengths(file_unit)

    associate(num_lines => size(lengths))

      allocate(file_object%lines_(num_lines))
  
      do line_num = 1, num_lines
        allocate(character(len=lengths(line_num)) :: line)
        read(file_unit, '(a)') line
        file_object%lines_(line_num) = string_t(line)
        deallocate(line)
      end do

    end associate

    close(file_unit)

  contains
   
    function line_count(file_unit) result(num_lines)
      integer, intent(in) :: file_unit
      integer num_lines
    
      rewind(file_unit)
      num_lines = 0 
      do  
        read(file_unit, *, iostat=io_status)
        if (io_status==iostat_end) exit
        num_lines = num_lines + 1 
      end do
      rewind(file_unit)
    end function

    function line_lengths(file_unit) result(lengths)
      integer, intent(in) :: file_unit
      integer, allocatable ::  lengths(:)
      integer io_status, l
      character(len=1) c

      associate(num_lines => line_count(file_unit))

        allocate(lengths(num_lines), source = 0)
        rewind(file_unit)

        do l = 1, num_lines
          do
            read(file_unit, '(a)', advance='no', iostat=io_status, iomsg=error_message) c
            associate(eliminate_unused_variable_warning => c) ! eliminate NAG compiler "variable c set but never referenced" warning
            end associate
            if (io_status==iostat_eor .or. io_status==iostat_end) exit
            lengths(l) = lengths(l) + 1
          end do
        end do

        rewind(file_unit)
  
      end associate
    end function

  end procedure

end submodule julienne_file_s
