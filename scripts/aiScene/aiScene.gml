function aiScene() constructor {
	
	mName = "";
	mFlags = 0;
	mRootNode = new aiNode();
	mMeshes = [];
	mMaterials = [];
	mAnimations = [];
	mTextures = [];
	mLights = [];
	mCameras = [];
	mSkeletons = [];
	mMetaData = {};
	
	
	/// @ignore
	static __read_bound = function() {
		mName = ASSIMP_GetSceneName();
		mRootNode = ASSIMP_BindSceneNode();
		mRootNode.__read_bound();
		
		mMeshes
	}
	
	
}