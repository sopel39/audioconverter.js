// Simple ffmpeg web worker based on (https://github.com/bgrins/videoconverter.js/blob/master/demo/worker.js)

importScripts('js/ffmpeg.js');

function print(text) {
    postMessage({
        'type' : 'stdout',
        'data' : text
    });
}

function printErr(text) {
    postMessage({
        'type' : 'stderr',
        'data' : text
    });
}

self.addEventListener('message', function(event) {
    var message = event.data;
    if (message.type === "command") {
        postMessage({
            'type' : 'start',
        });
                      
        var Module = {
            print: print,
            printErr: printErr,
            files: message.files || [],
            arguments: message.arguments || []
        };
                      
        postMessage({
            'type' : 'stdout',
            'data' : 'Received command: ' + Module.arguments.join(" ")
        });
        
        var time = Date.now();
        var result = ffmpeg_run(Module);
        var totalTime = Date.now() - time;

        postMessage({
            'type' : 'stdout',
            'data' : 'Finished processing (took ' + totalTime + 'ms)'
        });
        
        // use transferrable objects
        var buffers = [];
        for (var i in result.outputFiles) {
            buffers.push(result.outputFiles[i]);
        }
                      
        postMessage({
            'type' : 'done',
            'data' : result
        }, buffers);
    }
}, false);

// ffmpeg loaded
postMessage({
    'type' : 'ready'
});
