// @author		Giacomo Marton
// @version		1.0.0


/**
 * Assimp importer
 */
function aiImporter() constructor {
	
	mErrorString = "";
	
	/// @ignore
	static _extension_list = "";
	/// @ignore
	static _dll_working = false;
	
	/// @ignore
	static _initialized = false;
	// First call initialization
	if (!_initialized) {
		_initialized = true;
		
		_dll_working = ASSIMP_IsWorking();
		if (_dll_working) {
			var _importer = ASSIMP_CreateImporter();
			ASSIMP_BindImporter(_importer);
			_extension_list = ASSIMP_GetImporterExtensionList();
			ASSIMP_DeleteImporter(_importer);
		}
	}
	
	//Resets all properties to default values
	static ResetProperties = function() {
		/// @ignore
		_properties_bool = {};
		_properties_integer = {};
		_properties_float = {};
		_properties_string = {};
		_properties_matrix = {};
	}
	ResetProperties();
	
	
	
	// Returns if the GMAssimp dll is working
	static IsWorking = function() {
		return _dll_working;
	}
	
	static GetExtensionList = function() {
		return _extension_list;
	}
	
	static SetPropertyBool = function(_szName, value) {
		_properties_bool[$ _szName] = value;
	}
	
	static SetPropertyInteger = function(_szName, value) {
		_properties_integer[$ _szName] = value;
	}
	
	static SetPropertyFloat = function(_szName, value) {
		_properties_float[$ _szName] = value;
	}
	
	static SetPropertyString = function(_szName, value) {
		_properties_string[$ _szName] = value;
	}
	
	static SetPropertyMatrix = function(_szName, value) {
		_properties_matrix[$ _szName] = value;
	}
	
	static ReadFile = function(_pFile, _pFlags) {
		
		if (_dll_working) {
			var _importer = ASSIMP_CreateImporter();
			ASSIMP_BindImporter(_importer);
			struct_foreach(_properties_bool, function(_name, _value) {
				ASSIMP_SetImporterPropertyBool(_name, _value);
			});
			struct_foreach(_properties_integer, function(_name, _value) {
				ASSIMP_SetImporterPropertyInteger(_name, _value);
			});
			struct_foreach(_properties_float, function(_name, _value) {
				ASSIMP_SetImporterPropertyFloat(_name, _value);
			});
			struct_foreach(_properties_string, function(_name, _value) {
				ASSIMP_SetImporterPropertyString(_name, _value);
			});
			struct_foreach(_properties_matrix, function(_name, _value) {
				ASSIMP_SetImporterPropertyMatrixPrepare(_value[0], _value[1], _value[2], _value[3],
														_value[4], _value[5], _value[6], _value[7],
														_value[8], _value[9], _value[10], _value[11],
														_value[12], _value[13], _value[14], _value[15]);
				ASSIMP_SetImporterPropertyMatrix(_name);
			});
			var _check = ASSIMP_ReadFile(_pFile, _pFlags);
			mErrorString = ASSIMP_GetImporterErrorString();
			if (_check) {
				ASSIMP_BindScene();
				var _scene =  new aiScene();
				_scene.__read_bound();
				ASSIMP_DeleteImporter(_importer);
				return _scene;
			}
			
			ASSIMP_DeleteImporter(_importer);
		} else {
			mErrorString = "DLL not working";
		}
	}
}