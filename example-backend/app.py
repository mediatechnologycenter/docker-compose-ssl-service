from http import HTTPStatus

from flask import Flask, Response

app = Flask(__name__)


@app.route("/api")
def home():
    return Response(
        response="Welcome to the MTC SSL-Service Backend",
        status=HTTPStatus.OK,
    )


@app.route("/api/liveness")
def liveness():
    return Response(
        response="liveness check: [ok]",
        status=HTTPStatus.OK,
    )


@app.route("/api/readiness")
def readiness():
    return Response(
        response="Service readiness: [True]",
        status=HTTPStatus.OK,
    )


print("Proxy is running")
