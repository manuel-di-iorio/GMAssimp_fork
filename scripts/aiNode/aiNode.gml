function aiNode() constructor {
	mName = "";
	mTransformation = matrix_build_identity();
	mChildren = [];
	mMeshes = [];
	//mMetaData = {};
	
	
	/// @ignore
	static __read_bound = function() {
		mName = ASSIMP_GetNodeName();
		
		mTransformation = [
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
		
		var _num_meshes = ASSIMP_GetNodeMeshNum();
		for (var _i = 0; _i <_num_meshes; _i++) {
			array_push(mMeshes, ASSIMP_GetNodeMeshIndex(_i));
		}
		
		var _num_nodes = ASSIMP_GetNodeMeshNum();
		for (var _i = 0; _i <_num_nodes; _i++) {
			var _node = new aiNode();
			ASSIMP_BindNodeChild(_i);
			_node.__read_bound();
			ASSIMP_BindNodeParent();
			
			array_push(mChildren, _node);
		}
		
	}
}