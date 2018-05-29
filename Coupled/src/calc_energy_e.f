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

      subroutine calc_energy_e(energy,eddy_ke,u,v,r,dx,dy,nx,ny)

      implicit double precision (a-h,o-z)

      double precision u (nx, ny)
      double precision v (nx, ny)
      double precision r (nx, ny)

c interpolated to the center velocities
      double precision u_i (nx, ny)
      double precision v_i (nx, ny)
 
      energy = 0.d0
      eddy_ke = 0.d0

      umean = 0.d0
      vmean = 0.d0

      umean_eddy = 1.d0 ! given mean for eddy_ke
      vmean_eddy = 1.d0

c interpolate u velocities to the centers 


      do j = 1, ny
        do i = 1, nx-1
          u_i(i,j) = 0.5d0*(u(i,j) + u(i+1,j))
        enddo
c last one (b/c of periodic bcs)
          u_i(nx,j) = 0.5d0*(u(nx,j) + u(1,j))
      enddo

c interpolate v velocities

       do i = 1,nx
         do j = 1,ny-1
           v_i(i,j) = 0.5d0*(v(i,j) + v(i,j+1))
         enddo
c last one (b/c of periodic bcs)
         v_i(i,ny) = 0.5d0*(v(i,ny) + v(i,1))
       enddo



c now calc kinetic energy
      do j = 1, ny

        do i = 1, nx

           vel_mag_sq = (u_i(i,j)-umean)**2.d0 
     &                 + (v_i(i,j)-vmean)**2.d0

           energy = energy + r(i,j)*vel_mag_sq

c calc eddy_ke
    
           vel_mag_sq_eddy = (u_i(i,j)-umean_eddy)**2.d0
     &                      +(v_i(i,j)-vmean_eddy)**2.d0

           eddy_ke = eddy_ke + r(i,j)*vel_mag_sq_eddy
  
        enddo

      enddo
    
      energy = 0.5d0*dx*dy*energy
 
      eddy_ke = 0.5d0*dx*dy*eddy_ke
 

      return
      end