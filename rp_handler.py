import runpod
import time
import asyncio

def handler(event):
    print(f"Worker Start")
    input = event['input']

    prompt = input.get('prompt')
    seconds = input.get('seconds', 0)

    print(f"Recieved prompt: {prompt}")
    print(f"Sleeping for {seconds} seconds...")

    time.sleep(seconds)
    return prompt

async def handler_async(event):
    print(f"Worker Start")
    input = event['input']

    #prompt = input.get('prompt')
    seconds = input.get('seconds', 0)
    items = input.get('items', 0)

    #print(f"Recieved prompt: {prompt}")
    print(f"Sleeping for {seconds} seconds...")

    for i in range(items):
        output = f"Processing for index {i} of items..."
        await asyncio.sleep(seconds)
        yield output

    #return prompt

if __name__ == '__main__':
    runpod.serverless.start({
        'handler': handler_async,
        'return_aggregate_stream': True
    })
