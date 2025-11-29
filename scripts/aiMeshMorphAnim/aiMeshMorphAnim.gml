function aiMeshMorphAnim() constructor {
	mName = "";
	mKeys = [];
	
	
	/// @ignore
	static __read_bound = function() {
		mName = ASSIMP_GetMorphMeshAnimName();
		
		var _mNumKeys = ASSIMP_GetMeshAnimKeysNum();
		for (var _i = 0; _i < _mNumKeys; _i++) {
			var _key = new aiMeshKey();
			_key.mTime = ASSIMP_GetMeshAnimKeyTime(_i);
			var _num_values = ASSIMP_GetMorphMeshAnimKeyNumValuesAndWeights(_i);
			for (var _j = 0; _j < _num_values; _j++) {
				var _value = {
					value: ASSIMP_GetMorphMeshAnimKeyValue(_i, _j),
					weight: ASSIMP_GetMorphMeshAnimKeyWeight(_i, _j)
				}
				array_push(_key.mValues, _value)
			}
			array_push(mKeys, _key);
		}
		
	}
}