import runpod
import subprocess

def handler(event):
    input = event['input']
        
    index = input.get('index', '0')
    scene = input.get('scene', '0')
    token = input.get('token', '0')
    
    cmd_1 = ['SCRIPTS/video_download.sh',f'{index}', f'{token}']
    cmd_2 = ['SCRIPTS/run_glo.sh']
    
    subprocess.call(cmd_1)
    yield "Video download complete"
    subprocess.call(cmd_2)
    yield "Camera tracking complete"    
    

runpod.serverless.start({"handler": handler})