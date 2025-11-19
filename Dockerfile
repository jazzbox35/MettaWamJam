FROM swipl:latest

# Install system build tools, Python, and Apache
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      git \
      nano \
      build-essential \
      procps \
      curl \
      python3 \
      python3-pip \
      python3-dev \
 && rm -rf /var/lib/apt/lists/*

# Install janus-swi system-wide
RUN pip3 install --no-cache-dir --break-system-packages janus-swi 

# Clone PeTTa repository directly into /PeTTa
RUN git clone https://github.com/patham9/PeTTa.git /PeTTa
COPY mwj.pl /PeTTa
WORKDIR /PeTTa

# The Prolog server listens on 5000
EXPOSE 5000

# Start the Metta WAM server when the container runs
#CMD ["swipl", "mwj.pl"]

# Always run your server
ENTRYPOINT ["swipl", "mwj.pl"]

# 👇 **No default argument**
CMD []
