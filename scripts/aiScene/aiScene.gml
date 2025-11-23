function aiScene() constructor {
	
	mName = "";
	//mFlags = 0;
	mRootNode = new aiNode();
	mMeshes = [];
	mMaterials = [];
	mAnimations = [];
	mTextures = [];
	mLights = [];
	mCameras = [];
	mSkeletons = [];
	//mMetaData = {};
	
	
	/// @ignore
	static __read_bound = function() {
		mName = ASSIMP_GetSceneName();
		
		ASSIMP_BindSceneNode();
		mRootNode = new aiNode();
		mRootNode.__read_bound();
		
		var _num_meshes = ASSIMP_GetMeshNum();
		for (var _i = 0; _i < _num_meshes; _i++) {
			var _mesh = new aiMesh();
			ASSIMP_BindMesh(_i);
			_mesh.__read_bound();			
			array_push(mMeshes, _mesh);
		}
		
		var _num_materials = ASSIMP_GetMaterialNum();
		for (var _i = 0; _i < _num_materials; _i++) {
			var _material = new aiMaterial();
			ASSIMP_BindMesh(_i);
			_material.__read_bound();			
			array_push(mMaterials, _material);
		}
	}
	
	
}