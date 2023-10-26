FROM  public.ecr.aws/lambda/ruby:3.2

ENV RUBY_YJIT_ENABLED=1
ENV LAMBDA_TASK_ROOT=/var/task

RUN mkdir -p ${LAMBDA_TASK_ROOT}
WORKDIR ${LAMBDA_TASK_ROOT}

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ${LAMBDA_TASK_ROOT}/

ENV LAMBDA_ENV="production" \
    BUNDLE_PATH=${LAMBDA_TASK_ROOT}/vendor/bundle \
    BUNDLE_WITHOUT="development"

# Install Bundler and the specified gems
RUN gem install bundler:2.4.20 && \
    bundle config set --local path 'vendor/bundle' && \
    bundle install

# Copy function code
COPY lib/ ${LAMBDA_TASK_ROOT}/

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_demo.LambdaDemo::Handler.process" ]
