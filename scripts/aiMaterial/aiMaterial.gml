function aiMaterial() constructor {
	
	mName = "";
	
	
	
	
	
	
	mMaterialIndex = 0;
	mPrimitiveTypes = 0;
	mNumVertices = 0;
	mVertices = [];
	mNormals = [];
	mTangents = [];
	mBitangents = [];
	mColors = [];
	mUVChannels = [];
	mFaces = [];
	mBones = [];
	mAnimMeshes = [];
	
	static GetNumColorChannels = function() {
		return array_length(mColors);
	}
	
	
	
	/// @ignore
	static __read_bound = function() {
		
	}
}