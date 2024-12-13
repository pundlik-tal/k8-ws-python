FROM python:3.11.0a1-slim AS python-base

FROM python-base AS order-service
WORKDIR /usr/share/order_service
COPY order_service/ ${WORKDIR}
COPY requirements.txt .
RUN pip install -r requirements.txt
CMD [ "python", "order_app.py" ]

FROM python-base AS inventory-service
WORKDIR /usr/share/inventory_service
COPY inventory_service/ ${WORKDIR}
COPY requirements.txt .
RUN pip install -r requirements.txt
CMD [ "python", "inventory_app.py" ]
