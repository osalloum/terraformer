FROM amd64/ubuntu:focal 

RUN apt update
RUN apt install -y git vim curl zip
RUN curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-all-linux-amd64 
RUN mv terraformer-all-linux-amd64 /usr/bin/terraformer
RUN chmod +x /usr/bin/terraformer
RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
RUN echo 'export PATH="/root/.tfenv/bin:$PATH"' >> /root/.bashrc
RUN /root/.tfenv/bin/tfenv install 1.0.0
RUN /root/.tfenv/bin/tfenv use 1.0.0
RUN echo 'cd /root/terraformer && terraform init' >> /root/.bashrc
