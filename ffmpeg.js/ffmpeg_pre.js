// Simple ffmpeg.js module wrapper based on (https://github.com/bgrins/videoconverter.js/blob/master/build/ffmpeg_pre.js)

function ffmpeg_run(opts) {
    var Module = {
        'outputDirectory': 'output'
    };

    // copy module arguments
    for (var i in opts) {
        Module[i] = opts[i];
    }

    // extract output file path from arguments
    var outputFilePath = Module['arguments'][Module['arguments'].length - 1];
    if (Module['arguments'].length > 2 && outputFilePath && outputFilePath.indexOf(".") > -1) {
        // append output prefix
        Module['arguments'][Module['arguments'].length - 1] = Module['outputDirectory'] + "/" + outputFilePath;
    }

    Module['preRun'] = function() {
        // create output directory folder
        FS.createFolder('/', Module['outputDirectory'], true, true);

        // create input files with data
        if (Module['files']) {
            Module['files'].forEach(function(file) {
                FS.createDataFile('/', file.name,  new Uint8Array(file.buffer), true, true);
            });
        }
        
        // convert \r into \n for stdout
        var curr_tty_put_char = TTY.default_tty_ops.put_char;
        TTY.default_tty_ops.put_char = function (tty, val) {
            curr_tty_put_char(tty, val === 13 ? 10 : val);
        }
        var curr_tty1_put_char = TTY.default_tty1_ops.put_char;
        TTY.default_tty1_ops.put_char = function (tty, val) {
            curr_tty1_put_char(tty, val === 13 ? 10 : val);
        }
    };

    Module['postRun'] = function() {
        var handle = FS.analyzePath(Module['outputDirectory']);
        Module['return'] = {'outputFiles': getOutputFiles(handle), 'code': EXITSTATUS};
    };

    function getOutputFiles(result) {
        // create buffer for each output file
        var outputFiles = {}
        if (result && result.object && result.object.contents) {
            for (var i in result.object.contents) {
                if (result.object.contents.hasOwnProperty(i)) {
                    outputFiles[i] = new Uint8Array(result.object.contents[i].contents).buffer;
                }
            }
        }
        return outputFiles;
    }
