function aiVector2D(_x = 0, _y = 0) constructor {
	x = _x;
	y = _y;
	
	static equal = function(_other) {
		return	x == _other.x &&
				y == _other.y ;
	}
	
	static length = function() {
		return sqrt(x*x + y*y);
	}
	
	static normalize = function() {
		var f = sqrt(x*x + y*y);
		if f != 0 {
			x /= f;
			y /= f;
		}
		return self;
	}
	
	static square_length = function() {
		return x*x + y*y;
	}
}