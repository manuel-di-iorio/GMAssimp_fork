/// Constants defined in the dll, it must be recompiled and update this script if you wanto to change them
#macro AI_MAX_BONE_WEIGHTS				0x7fffffff
#macro AI_MAX_FACE_INDICES				0x7fff
#macro AI_MAX_FACES						0x7fffffff
#macro AI_MAX_NUMBER_OF_COLOR_SETS		0x8
#macro AI_MAX_NUMBER_OF_TEXTURECOORDS	0x8
#macro AI_MAX_VERTICES					0x7fffffff



function aiMesh() constructor{
	mAnimMeshes = undefined;
	mBitangents = [];
	mBones = [];
	mColors = array_create(AI_MAX_NUMBER_OF_COLOR_SETS, []);
	mFaces = [];
	mMaterialIndex = 0;
	mName = "";
	mNormals = [];
	mNumAnimMeshes = 0;
	mNumBones = 0;
	mNumFaces = 0;
	mNumUVComponents = array_create(AI_MAX_NUMBER_OF_TEXTURECOORDS, 0);
	mNumVertices = 0;
	mPrimitiveTypes = 0;
	mTangents = [];
	mTextureCoords = array_create(AI_MAX_NUMBER_OF_TEXTURECOORDS, []);
	mVertices = [];
	
	static GetNumColorChannels = function() {
		return array_length(mColors);	
	}
	
	static GetNumUVChannels = function() {
		return array_length(mTextureCoords);	
	}
	
	static HasBones = function() {
		return mNumBones > 0;	
	}
	
	static HasFaces = function() {
		return mFaces > 0;	
	}
	
	static HasNormals = function() {
		return mNormals > 0;	
	}
	
	static HasPositions = function() {
		return mVertices > 0;	
	}
	
	static HasTangentsAndBitangents = function() {
		return mTangents > 0;	
	}
	
	static HasTextureCoords = function() {
		for (var _i = 0; _i < mNumUVComponents; _i++) {
			if ( array_length(mTextureCoords[_i]) > 0 ) {
				return true;	
			}
		}
		return false;
	}
	
	static HasVertexColors = function() {
		for (var _i = 0; _i < GetNumColorChannels(); _i++) {
			if ( array_length(mColors[_i]) > 0 ) {
				return true;	
			}
		}
		return false;
	}
	
	
	
	/// @ignore
	static __read_bound = function() {
		ASSIMP_GetMeshFacesNum()
		
		mName = ASSIMP_GetMeshName();
		
		mNumVertices = ASSIMP_GetMeshVerticesNum();
		
		mVertices = array_create(mNumVertices, 0);
			for (var _i = 0; _i < mNumVertices; _i++) {
					var _v = new aiVector3D();
					_v.x = ASSIMP_GetMeshVertexX(_i);
					_v.y = ASSIMP_GetMeshVertexY(_i);
					_v.z = ASSIMP_GetMeshVertexZ(_i);
					array_push(mVertices, _v);
			}
		
		if (ASSIMP_MeshHasNormals()()) {
			mNormals = array_create(mNumVertices, 0);
			for (var _i = 0; _i < mNumVertices; _i++) {
					var _v = new aiVector3D();
					_v.x = ASSIMP_GetMeshNormalX()(_i);
					_v.y = ASSIMP_GetMeshNormalY(_i);
					_v.z = ASSIMP_GetMeshNormalZ(_i);
					array_push(mNormals, _v);
			}
		}
		if (ASSIMP_MeshHasTangents()) {
			mTangents = array_create(mNumVertices, 0);
			for (var _i = 0; _i < mNumVertices; _i++) {
					var _v = new aiVector3D();
					_v.x = ASSIMP_GetMeshTangentX()(_i);
					_v.y = ASSIMP_GetMeshTangentY(_i);
					_v.z = ASSIMP_GetMeshTangentZ(_i);
					array_push(mTangents, _v);
			}
			mBitangents = array_create(mNumVertices, 0);
			for (var _i = 0; _i < mNumVertices; _i++) {
					var _v = new aiVector3D();
					_v.x = ASSIMP_GetMeshBitangentX(_i);
					_v.y = ASSIMP_GetMeshBitangentY(_i);
					_v.z = ASSIMP_GetMeshBitangentZ(_i);
					array_push(mBitangents, _v);
			}
		}
		
		mPrimitiveTypes = ASSIMP_GetMeshPrimitiveTypes();
		
		mNumFaces = ASSIMP_GetMeshFacesNum();
		
		mFaces = array_create(mNumFaces, 0);
			for (var _i = 0; _i < mNumFaces; _i++) {
				var _num_vert = ASSIMP_GetMeshFaceVerticesNum(_i);
				mFaces[_i] = array_create(_num_vert, 0);
				for (var _v = 0; _v < _num_vert; _v++) {
					mFaces[_i][_v] = ASSIMP_GetMeshFaceVertexIndex(_i, _v);
				}
			}
		
		mNumBones = ASSIMP_GetMeshBonesNum();
		mBones = array_create(mNumBones, 0);
			for (var _i = 0; _i < mNumBones; _i++) {
				ASSIMP_BindMeshBone(_i);
				
				var _bone = new aiBone();
				_bone.mName = ASSIMP_GetBoneName();
				ASSIMP_BindBoneOffsetMatrix();
				_bone.mOffsetMatrix = [
					ASSIMP_GetMatrixA1(),
					ASSIMP_GetMatrixB1(),
					ASSIMP_GetMatrixC1(),
					ASSIMP_GetMatrixD1(),
					ASSIMP_GetMatrixA2(),
					ASSIMP_GetMatrixB2(),
					ASSIMP_GetMatrixC2(),
					ASSIMP_GetMatrixD2(),
					ASSIMP_GetMatrixA3(),
					ASSIMP_GetMatrixB3(),
					ASSIMP_GetMatrixC3(),
					ASSIMP_GetMatrixD3(),
					ASSIMP_GetMatrixA4(),
					ASSIMP_GetMatrixB4(),
					ASSIMP_GetMatrixC4(),
					ASSIMP_GetMatrixD4()
				];
				_bone.mNumWeights = ASSIMP_GetBoneNumWeights();
				_bone.mWeights = array_create(mNumWeights, 0);
				for (var _w = 0; _w < mNumWeights; _w++) {
					mWeights[_w] = new aiVertexWeight(
						ASSIMP_GetBoneVertexIndex(_w),
						ASSIMP_GetBoneVertexWeight(_w)
					);
				}
				
				mBones[_i] = _bone;
			}
		
		
		
		mColors = array_create(AI_MAX_NUMBER_OF_COLOR_SETS, []);
		mFaces = [];
		mMaterialIndex = 0;
		mNumAnimMeshes = 0;
		mNumFaces = 0;
		mNumUVComponents = array_create(AI_MAX_NUMBER_OF_TEXTURECOORDS, 0);
		mPrimitiveTypes = 0;
		mTextureCoords = array_create(AI_MAX_NUMBER_OF_TEXTURECOORDS, []);
		mVertices = [];
	}
}