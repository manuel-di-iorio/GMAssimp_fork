function aiLight() constructor {
	
	mName = "";
	mType = aiLightSourceType.UNDEFINED;
	mPosition = new aiVector3D();
	mDirection = new aiVector3D();
	mUp = new aiVector3D();
	mAttenuationConstant = 0;
	mAttenuationLinear = 1;
	mAttenuationQuadratic = 0;
	mColorDiffuse = new aiColor3D();
	mColorSpecular = new aiColor3D();
	mColorAmbient = new aiColor3D();
	mAngleInnerCone = pi*2;
	mAngleOuterCone = pi*2;
	mSize = new aiVector2D();
	
	
	/// @ignore
	static __read_bound = function() {
		mName = ASSIMP_GetLightName();
		
		mType = ASSIMP_GetLightSourceType();
		
		mPosition = new aiVector3D(
			ASSIMP_GetLightPositionX(),
			ASSIMP_GetLightPositionY(),
			ASSIMP_GetLightPositionZ()
		);
		
		mDirection = new aiVector3D(
			ASSIMP_GetLightDirectionX(),
			ASSIMP_GetLightDirectionY(),
			ASSIMP_GetLightDirectionZ()
		);
		
		mUp = new aiVector3D(
			ASSIMP_GetLightUpX(),
			ASSIMP_GetLightUpY(),
			ASSIMP_GetLightUpZ()
		);
		
		mAttenuationConstant = ASSIMP_GetLightConstantAttenutation();
		
		mAttenuationLinear = ASSIMP_GetLightLinearAttenutation();
		
		mAttenuationQuadratic = ASSIMP_GetLightQuadraticAttenutation();
		
		mColorDiffuse = new aiColor3D(
			ASSIMP_GetLightDiffuseColorR(),
			ASSIMP_GetLightDiffuseColorG(),
			ASSIMP_GetLightDiffuseColorB()
		);
		
		mColorSpecular = new aiColor3D(
			ASSIMP_GetLightSpecularColorR(),
			ASSIMP_GetLightSpecularColorG(),
			ASSIMP_GetLightSpecularColorB()
		);
		
		mColorAmbient = new aiColor3D(
			ASSIMP_GetLightAmbientColorR(),
			ASSIMP_GetLightAmbientColorG(),
			ASSIMP_GetLightAmbientColorB()
		);
		
		mAngleInnerCone = ASSIMP_GetLightConeInnerAngle();
		
		mAngleOuterCone = ASSIMP_GetLightConeOuterAngle();
		
		mSize = new aiVector2D(
			ASSIMP_GetLightSizeX(),
			ASSIMP_GetLightSizeY()
		);
	}
}