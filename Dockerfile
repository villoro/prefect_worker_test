# -*- mode: shell-script -*-

FROM prefecthq/prefect:2.16-python3.10 as base

ARG PREFECT_TOKEN
ARG PREFECT_WORKSPACE=northius/default

# Set connection
RUN prefect cloud login -k ${PREFECT_TOKEN} -w ${PREFECT_WORKSPACE}
RUN prefect config set PREFECT_DEFAULT_WORK_POOL_NAME=subprocess-pool

CMD ["prefect", "worker", "start", "--pool", "subprocess-pool"]
