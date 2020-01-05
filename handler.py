import json


def hello(event, context):
    body = {
        "message": "Hello Welcome to serverless function!",
        "input": event
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response

    # Use this code if you don't use the http event with the LAMBDA-PROXY
    # integration
    """
    return {
        "message": "Hello Welcome to serverless function!",
        "event": event
    }
    """