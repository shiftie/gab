/* exported Loader */

class Loader {
    constructor() {
        /* Singleton */
        if(!Loader.prototype.instance){
            Loader.prototype.instance = this;
        }
        return Loader.prototype.instance;
    }

    handle(fn){
        fn();
    }

    static getInstance(){
        if(!Loader.prototype.instance){
            return new this();
        }else{
            return Loader.prototype.instance;
        }
    }
}
