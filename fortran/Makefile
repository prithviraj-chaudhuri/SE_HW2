fortran-build:
	docker build -f Dockerfile_fortran -t fortran .

fortran-run:
	docker run --rm --name fortran_gof fortran

fortran-debug: fortran-build fortran-run
