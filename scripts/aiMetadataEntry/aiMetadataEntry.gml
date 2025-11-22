enum aiMetadataType {
	BOOL = 0,
	INT32 = 1,
	UINT64 = 2,
	FLOAT = 3,
	DOUBLE = 4,
	STRING = 5,
	AIVECTOR3D = 6,
	AIMETADATA = 7,
	INT64 = 8,
	UINT32 = 9,
	META_MAX = 10,
}

function aiMetadataEntry() constructor {
	mType = aiMetadataType.META_MAX;
	// Based on its type, can be one of these:
	// undefined, String, Real, aiVec3D, and finally a struct for mapping other aiMetadata's
	mData = undefined;
	
	/// @ignore
	static __read_bound = function(_id) {
		mType = ASSIMP_GetMetadataValueType(_id);
		
		if (mType == aiMetadataType.BOOL ||
			mType == aiMetadataType.INT32 ||
			mType == aiMetadataType.UINT64 ||
			mType == aiMetadataType.FLOAT ||
			mType == aiMetadataType.DOUBLE ||
			mType == aiMetadataType.INT64 ||
			mType == aiMetadataType.UINT32) {
				mData = ASSIMP_GetMetadataValueDataDouble(_id);
		}
		
		if (mType == aiMetadataType.STRING) {
				mData = ASSIMP_GetMetadataValueDataString(_id);
		}
		
		if (mType == aiMetadataType.AIVECTOR3D) {
				mData = new aiVector3D(
					ASSIMP_GetMetadataValueDataVectorX(_id),
					ASSIMP_GetMetadataValueDataVectorY(_id),
					ASSIMP_GetMetadataValueDataVectorZ(_id)
				);
		}
		
		if (mType == aiMetadataType.AIMETADATA) {
			//TODO
			//Need to update dll to support metadata stacks
		}
	}
}