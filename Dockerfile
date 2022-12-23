FROM public.ecr.aws/sam/build-python3.8

RUN yum install -y \
    lapack-devel

ENV CFLAGS="-g0 -Wl,--strip-all -I/usr/include:/usr/local/include -L/usr/lib:/usr/local/lib"

WORKDIR /var/task

COPY compile.sh compile.sh
