Array.prototype.frequencies = function () {
    var freqs = {}
    this.map(function (a) {
        if (!(a in this)) {
            this[a] = 1;
        } else {
            this[a] += 1;
        }
        return a;
    }, freqs);
    return (_.sortBy(_.pairs(freqs), function(num){return num[1]} )).reverse()
}