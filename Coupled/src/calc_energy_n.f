!***********************************************************************
! LICENSING
! Copyright (C) 2013  National Renewable Energy Laboratory (NREL)
!
!    This is free software: you can redistribute it and/or modify it
!    under the terms of the GNU General Public License as
!    published by the Free Software Foundation, either version 3 of the
!    License, or (at your option) any later version.
!
!    This program is distributed in the hope that it will be useful, but
!    WITHOUT ANY WARRANTY; without even the implied warranty
!    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    GNU General Public License for more details.
!
!    You should have received a copy of the GNU General Public License 
!    along with this program.
!    If not, see <http://www.gnu.org/licenses/>.
!
!***********************************************************************
!    This code was created at NREL by Michael A. Sprague and Ignas 
!    Satkauskas  and was meant for open-source distribution.
!
!    Software was created under funding from a Shared Research Grant 
!    from the Center for Research and Education in Wind (CREW), during
!    the period 01 October 2011 - 31 January 2013.
!
!    http://crew.colorado.edu/ 
!
!    Questions?  Please contact Michael Sprague:
!    email:  michael.a.sprague@nrel.gov
!
!***********************************************************************

      subroutine calc_energy_n(energy,energy2d,u,v,r,
     &                         eddy_ke, dx,dy,nx,ny)

      implicit double precision (a-h,o-z)

      double precision u (nx, ny)
      double precision v (nx, ny)
      double precision r (nx, ny)
      double precision energy2d (nx, ny)
 
      energy = 0.d0

      eddy_ke = 0.0

      umean = 0.d0 ! given mean
      vmean = 0.d0 

   
      umean_eddy = 1.d0 ! given mean for eddy_ke
      vmean_eddy = 1.d0 

c calc kinetic energy

      do j = 1, ny

        do i = 1, nx
           
           vel_mag_sq = (u(i,j)-umean)**2
     &                 +(v(i,j)-vmean)**2


           energy = energy + r(i,j)*(vel_mag_sq)
           energy2d(i,j) = 0.5d0*r(i,j)*vel_mag_sq

c eddy_ke
           vel_mag_sq_eddy = (u(i,j)-umean_eddy)**2
     &                      +(v(i,j)-vmean_eddy)**2


           eddy_ke = eddy_ke + vel_mag_sq_eddy
 

        enddo

      enddo
    
      energy = 0.5d0*dx*dy*energy
     
      eddy_ke = 0.5d0*dx*dy*eddy_ke

cc calc mean flow
c      u_sum =0.d0
c      v_sum =0.d0
c
c      do j = 1, ny
c        do i = 1, nx
c
c           u_sum = u_sum + u(i,j) 
c           v_sum = v_sum + v(i,j) 
c
c        enddo
c      enddo
c
c      u_mean = u_sum / float(nx*ny) 
c      v_mean = v_sum / float(nx*ny) 
       

      return
      end
