FROM rocker/verse:4.2.2
RUN apt-get update -y && apt-get install -y  make  libcurl4-openssl-dev  libicu-dev  libssl-dev  zlib1g-dev  libglpk-dev  libgmp3-dev  libxml2-dev  pandoc && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/R/etc/ /usr/lib/R/etc/
RUN echo "options(renv.config.pak.enabled = TRUE, repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site
RUN R -e 'install.packages(c("renv","remotes"))'
COPY renv.lock renv.lock
RUN R -e 'renv::restore()'