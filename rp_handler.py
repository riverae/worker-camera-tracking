import runpod
import asyncio
import subprocess

async def async_handler(event):
    print(f"Worker Start")
    input = event['input']
    
    seconds = input.get('seconds', 0)
    items = input.get('items', 0)
    
    #print(f"Sleeping for {seconds} seconds...")

    cmd = ['./run_glo.sh']
    out = subprocess.Popen(cmd, stdout=subprocess.PIPE)#.run(cmd, capture_output=True, text=True)
    await print(out.stdout.decode('utf-8'))

    #for i in range(items):
    #    output = f"Processing for index {i} of items..."
    #    await asyncio.sleep(seconds)
    #    yield output

    

if __name__ == '__main__':
    runpod.serverless.start({
        'handler': async_handler,
        'return_aggregate_stream': True
    })
