import io from 'socket.io-client';
import {AuthStore} from '../auth/stores/AuthStore.js';


class _Socket {
    constructor(url) {
        this._socket = null;
        this._url = url;
    }

    get url() {
        return this._url;
    }

    set url(value) {
        this._url = value;
    }

    connect() {
        this._socket = io.connect(this.url);

        this._socket.on('connect', () => {
            let user = AuthStore.getUser();
            this._socket.emit('room', user.id);
        });
    }

    addEventListener(socketEvent, func) {
        if (!this._socket)
            this.connect();

        this._socket.addEventListener(socketEvent, func);
    }

    removeEventListener(socketEvent, func) {
        this._socket.removeEventListener(socketEvent, func);
    }

    disconnect() {
        if (this._socket)
            this._socket.disconnect();

        this._socket.on('disconnect', () => {
            this._socket = null;
        });
    }
}

//export const Socket = new _Socket('35.161.34.217:8283');
export const Socket = new _Socket(SOCKET_IP || window.location.origin);   
