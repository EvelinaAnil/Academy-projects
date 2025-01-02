const EventEmitter = require('events')

class Logger extends EventEmitter
{
    log(message)
    {
        this.emit('message', `${message} ${Date.now()}`);
    }

    log2(message)
    {
        this.emit('my_event', `${message} ${Date.now()}`);
    }
}
const logger = new Logger();
logger.on('message', data => {console.log(data)});
logger.on('my_event', data => {console.log(data)});

logger.log('1) Hello!!!');
logger.log('2) Hello!!!');
logger.log('3) Hello!!!');
logger.log('4) Hello!!!');
logger.log('5) Hello!!!');