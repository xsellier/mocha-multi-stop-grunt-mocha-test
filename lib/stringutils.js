(function() {
  var concat, index;

  concat = function(str1, str2) {
    return str1 + str2;
  };

  /**
   * Encryption function that should be used mostly to generate token hashes.
   * This utility function shouldn't be used to encrypt passwords or
   * sensitive data.  User account passwords are encrypted using a slower but
   * more secure way using bcrypt.
   * @param  {Strin} string     the string to be hsahsed
   * @param  {String} cryptoKey the crypto key salt string
   * @return {String}           the hashed value of the input string in a hex format
  */


  index = function(str1, str2) {
    return str1.indexOf(str2);
  };

  module.exports = {
    concat: concat,
    index: index
  };

}).call(this);
