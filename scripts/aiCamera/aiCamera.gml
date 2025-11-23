function aiCamera() constructor {
	
	mName = "";
	mPosition = new aiVector3D();
	mUp = new aiVector3D(0, 1, 0);
	mLookAt = new aiVector3D(0, 0, 1);
	mHorizontalFOV = pi * 0.25;
	mClipPlaneNear = 0.1;
	mClipPlaneFar = 1000;
	mAspect = 0;
	mOrthographicWidth = 0;
	mMatrix = matrix_build_identity();
	
	
	/// @ignore
	static __read_bound = function() {
		mName = ASSIMP_GetCameraName();
		
		
		mPosition = new aiVector3D(
			ASSIMP_GetCameraPositionX(),
			ASSIMP_GetCameraPositionY(),
			ASSIMP_GetCameraPositionZ()
		);
		
		mUp = new aiVector3D(
			ASSIMP_GetCameraUpX(),
			ASSIMP_GetCameraUpY(),
			ASSIMP_GetCameraUpZ()
		);
		
		mLookAt = new aiVector3D(
			ASSIMP_GetCameraLookAtX(),
			ASSIMP_GetCameraLookAtY(),
			ASSIMP_GetCameraLookAtZ()
		);
		
		mHorizontalFOV = ASSIMP_GetCameraHorizontalFov();
		
		mClipPlaneNear = ASSIMP_GetCameraClipPlaneNear();
		
		mClipPlaneFar = ASSIMP_GetCameraClipPlaneFar();
		
		mAspect = ASSIMP_GetCameraAspect();
		
		mOrthographicWidth = ASSIMP_GetCameraOrthographicWidth();
		
		ASSIMP_BindCameraMatrix();
		mMatrix = [
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
		
	}
}