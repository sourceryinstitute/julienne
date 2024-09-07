! Copyright (c) 2024, The Regents of the University of California and Sourcery Institute
! Terms of use are as specified in LICENSE.txt
module julienne_github_ci_m
  !! Detect whether a program is running in GitHub Continuous Integration (CI)
  implicit none
   
  interface

    logical module function GitHub_CI()
    end function

  end interface

contains

  module procedure GitHub_CI

    integer name_length
    character(len=:), allocatable :: CI

    call get_environment_variable("CI", length=name_length)

    if (name_length==0) then
      GitHub_CI = .false.
    else
      allocate(character(len=name_length):: CI)
      call get_environment_variable("CI", value=CI)
      GitHub_CI = merge(.true., .false., CI=="true")
    end if

  end procedure

end module
