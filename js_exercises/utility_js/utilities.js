var _ = function(obj) {
  utils = {

    has: function(prop) {
      return !!obj[prop];
    },

    omit: function(to_omit) {
      var new_obj = {};
      var args = [].slice.call(arguments);

      for(var prop in obj) {
        !args.includes(prop) && (new_obj[prop] = obj[prop]);
      };

      return new_obj;
    },

    pick: function() {
      var new_obj = {};

      for(var idx in arguments) {
        var prop = arguments[idx];
        obj[prop] && ( new_obj[prop] = obj[prop] );
      };

      return new_obj;
    },

    values: function() {
      var vals = [];

      for(var prop in obj) {
        vals.push(obj[prop]);
      };
      return vals;
    },

    keys: function() {
      var keys_arry = [];

      for(var prop in obj) {
        keys_arry.push(prop);
      };
      return keys_arry;
    },

    pluck: function(key) {
      var plucked = [];
      obj.forEach(function(curr_obj) {
        curr_obj[key] && plucked.push(curr_obj[key]);
      });
      return plucked;
    },

    where: function(obj_to_match) {
      return obj.filter(function(curr_obj) {
        return !!_([curr_obj]).findWhere(obj_to_match)
      });
    },

    findWhere: function(obj_to_match) {
      for(var i = 0, obj_len = obj.length; i < obj_len; i++) {
        var match = true,
            curr_obj = obj[i];

        for(var prop in obj_to_match) {
          match = curr_obj[prop] === obj_to_match[prop] && match;
          if(!match) { break };
        };
        
         if(match) { return curr_obj };
      };
      
    },

    first: function() {
      return obj[0];
    },

    last: function() {
      return obj[obj.length - 1];
    },

    without: function() {
      var filtered = obj;

      for (var to_exclude in arguments) {
        filtered = filtered.filter(function(item) { return item !== arguments[to_exclude]; });
      };

      return filtered;
    },

    lastIndexOf: function(item) {
      for(var end = obj.length; end >= 0; end--) {
        if (item === obj[end]) {
          return end;
        };
      };
    },

    sample: function(quantity = 1) {
      var obj_len = obj.length;

      if(quantity === 1) { return obj[Math.floor(obj_len * Math.random())]; };

      var sample_arry = [],
          quant = 1,
          indices = [];

      while(quant <= quantity) {
        
        do {
          var next_index = Math.floor(obj_len * Math.random()),
              isRepeated = indices.includes(next_index);
        
        } while(indices.length <= quant && isRepeated);
          
        indices.push(next_index);
        sample_arry.push(obj[indices[quant - 1]]);
        quant++;
      };
      
      return sample_arry;
    }
    
   };

  return utils
};

_.range = function(a, b = undefined) {
      var sub_arry = [];

      if (b) {
        var start = a,
            stop = b;
      } else {
        var start = 0,
            stop = a;
      };

      for(; start < stop; start++) {
        sub_arry.push(start);
      };

      return sub_arry;
    };

_.extend = function() {

  if (arguments.length === 1 && Array.isArray(arguments[0])) {
    var args_arry = arguments[0];

  } else {
    var args_arry = Array.prototype.slice.call(arguments);
  };

  if (args_arry.length === 1) {
    return args_arry[0];

  } else {
    var popped = args_arry.pop(),
        new_len = args_arry.length;

    for(var prop in popped) {
      args_arry[new_len - 1][prop] = popped[prop];
    };

    return _.extend(args_arry);
  };
};
