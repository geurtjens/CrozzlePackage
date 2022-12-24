public class C3x4 {
    static func Execute(w: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        let wordCount = w.wordCount

        let lrlr_udu = ToShape.from(cluster: C3x4_LRLR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_dud = ToShape.from(cluster: C3x4_LRLR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_umd = ToShape.from(cluster: C3x4_LRLR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_dmu = ToShape.from(cluster: C3x4_LRLR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_dmo = ToShape.from(cluster: C3x4_LRLR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_umo = ToShape.from(cluster: C3x4_LRLR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_mom = ToShape.from(cluster: C3x4_LRLR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_omu = ToShape.from(cluster: C3x4_LRLR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_omd = ToShape.from(cluster: C3x4_LRLR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_omo = ToShape.from(cluster: C3x4_LRLR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_udu = ToShape.from(cluster: C3x4_RLRL_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_dud = ToShape.from(cluster: C3x4_RLRL_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_umd = ToShape.from(cluster: C3x4_RLRL_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_dmu = ToShape.from(cluster: C3x4_RLRL_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_dmo = ToShape.from(cluster: C3x4_RLRL_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_umo = ToShape.from(cluster: C3x4_RLRL_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_mom = ToShape.from(cluster: C3x4_RLRL_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_omu = ToShape.from(cluster: C3x4_RLRL_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_omd = ToShape.from(cluster: C3x4_RLRL_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_omo = ToShape.from(cluster: C3x4_RLRL_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_udu = ToShape.from(cluster: C3x4_LMRL_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_dud = ToShape.from(cluster: C3x4_LMRL_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_umd = ToShape.from(cluster: C3x4_LMRL_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_dmu = ToShape.from(cluster: C3x4_LMRL_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_dmo = ToShape.from(cluster: C3x4_LMRL_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_umo = ToShape.from(cluster: C3x4_LMRL_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_mom = ToShape.from(cluster: C3x4_LMRL_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_omu = ToShape.from(cluster: C3x4_LMRL_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_omd = ToShape.from(cluster: C3x4_LMRL_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmrl_omo = ToShape.from(cluster: C3x4_LMRL_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_udu = ToShape.from(cluster: C3x4_LRML_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_dud = ToShape.from(cluster: C3x4_LRML_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_umd = ToShape.from(cluster: C3x4_LRML_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_dmu = ToShape.from(cluster: C3x4_LRML_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_dmo = ToShape.from(cluster: C3x4_LRML_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_umo = ToShape.from(cluster: C3x4_LRML_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_mom = ToShape.from(cluster: C3x4_LRML_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_omu = ToShape.from(cluster: C3x4_LRML_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_omd = ToShape.from(cluster: C3x4_LRML_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrml_omo = ToShape.from(cluster: C3x4_LRML_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_udu = ToShape.from(cluster: C3x4_RMLR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_dud = ToShape.from(cluster: C3x4_RMLR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_umd = ToShape.from(cluster: C3x4_RMLR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_dmu = ToShape.from(cluster: C3x4_RMLR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_dmo = ToShape.from(cluster: C3x4_RMLR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_umo = ToShape.from(cluster: C3x4_RMLR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_mom = ToShape.from(cluster: C3x4_RMLR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_omu = ToShape.from(cluster: C3x4_RMLR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_omd = ToShape.from(cluster: C3x4_RMLR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmlr_omo = ToShape.from(cluster: C3x4_RMLR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_udu = ToShape.from(cluster: C3x4_RLMR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_dud = ToShape.from(cluster: C3x4_RLMR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_umd = ToShape.from(cluster: C3x4_RLMR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_dmu = ToShape.from(cluster: C3x4_RLMR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_dmo = ToShape.from(cluster: C3x4_RLMR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_umo = ToShape.from(cluster: C3x4_RLMR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_mom = ToShape.from(cluster: C3x4_RLMR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_omu = ToShape.from(cluster: C3x4_RLMR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_omd = ToShape.from(cluster: C3x4_RLMR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmr_omo = ToShape.from(cluster: C3x4_RLMR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_udu = ToShape.from(cluster: C3x4_LMOM_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_dud = ToShape.from(cluster: C3x4_LMOM_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_umd = ToShape.from(cluster: C3x4_LMOM_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_dmu = ToShape.from(cluster: C3x4_LMOM_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_dmo = ToShape.from(cluster: C3x4_LMOM_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_umo = ToShape.from(cluster: C3x4_LMOM_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_mom = ToShape.from(cluster: C3x4_LMOM_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_omu = ToShape.from(cluster: C3x4_LMOM_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_omd = ToShape.from(cluster: C3x4_LMOM_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmom_omo = ToShape.from(cluster: C3x4_LMOM_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_udu = ToShape.from(cluster: C3x4_LRMO_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_dud = ToShape.from(cluster: C3x4_LRMO_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_umd = ToShape.from(cluster: C3x4_LRMO_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_dmu = ToShape.from(cluster: C3x4_LRMO_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_dmo = ToShape.from(cluster: C3x4_LRMO_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_umo = ToShape.from(cluster: C3x4_LRMO_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_mom = ToShape.from(cluster: C3x4_LRMO_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_omu = ToShape.from(cluster: C3x4_LRMO_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_omd = ToShape.from(cluster: C3x4_LRMO_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrmo_omo = ToShape.from(cluster: C3x4_LRMO_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_udu = ToShape.from(cluster: C3x4_RMOM_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_dud = ToShape.from(cluster: C3x4_RMOM_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_umd = ToShape.from(cluster: C3x4_RMOM_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_dmu = ToShape.from(cluster: C3x4_RMOM_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_dmo = ToShape.from(cluster: C3x4_RMOM_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_umo = ToShape.from(cluster: C3x4_RMOM_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_mom = ToShape.from(cluster: C3x4_RMOM_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_omu = ToShape.from(cluster: C3x4_RMOM_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_omd = ToShape.from(cluster: C3x4_RMOM_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmom_omo = ToShape.from(cluster: C3x4_RMOM_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_udu = ToShape.from(cluster: C3x4_RLMO_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_dud = ToShape.from(cluster: C3x4_RLMO_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_umd = ToShape.from(cluster: C3x4_RLMO_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_dmu = ToShape.from(cluster: C3x4_RLMO_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_dmo = ToShape.from(cluster: C3x4_RLMO_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_umo = ToShape.from(cluster: C3x4_RLMO_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_mom = ToShape.from(cluster: C3x4_RLMO_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_omu = ToShape.from(cluster: C3x4_RLMO_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_omd = ToShape.from(cluster: C3x4_RLMO_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlmo_omo = ToShape.from(cluster: C3x4_RLMO_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_udu = ToShape.from(cluster: C3x4_MOML_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_dud = ToShape.from(cluster: C3x4_MOML_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_umd = ToShape.from(cluster: C3x4_MOML_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_dmu = ToShape.from(cluster: C3x4_MOML_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_dmo = ToShape.from(cluster: C3x4_MOML_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_umo = ToShape.from(cluster: C3x4_MOML_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_mom = ToShape.from(cluster: C3x4_MOML_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_omu = ToShape.from(cluster: C3x4_MOML_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_omd = ToShape.from(cluster: C3x4_MOML_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let moml_omo = ToShape.from(cluster: C3x4_MOML_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_udu = ToShape.from(cluster: C3x4_MOMR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_dud = ToShape.from(cluster: C3x4_MOMR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_umd = ToShape.from(cluster: C3x4_MOMR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_dmu = ToShape.from(cluster: C3x4_MOMR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_dmo = ToShape.from(cluster: C3x4_MOMR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_umo = ToShape.from(cluster: C3x4_MOMR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_mom = ToShape.from(cluster: C3x4_MOMR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_omu = ToShape.from(cluster: C3x4_MOMR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_omd = ToShape.from(cluster: C3x4_MOMR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momr_omo = ToShape.from(cluster: C3x4_MOMR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_udu = ToShape.from(cluster: C3x4_MOMO_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_dud = ToShape.from(cluster: C3x4_MOMO_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_umd = ToShape.from(cluster: C3x4_MOMO_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_dmu = ToShape.from(cluster: C3x4_MOMO_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_dmo = ToShape.from(cluster: C3x4_MOMO_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_umo = ToShape.from(cluster: C3x4_MOMO_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_mom = ToShape.from(cluster: C3x4_MOMO_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_omu = ToShape.from(cluster: C3x4_MOMO_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_omd = ToShape.from(cluster: C3x4_MOMO_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let momo_omo = ToShape.from(cluster: C3x4_MOMO_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_udu = ToShape.from(cluster: C3x4_OMOM_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_dud = ToShape.from(cluster: C3x4_OMOM_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_umd = ToShape.from(cluster: C3x4_OMOM_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_dmu = ToShape.from(cluster: C3x4_OMOM_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_dmo = ToShape.from(cluster: C3x4_OMOM_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_umo = ToShape.from(cluster: C3x4_OMOM_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_mom = ToShape.from(cluster: C3x4_OMOM_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_omu = ToShape.from(cluster: C3x4_OMOM_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_omd = ToShape.from(cluster: C3x4_OMOM_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omom_omo = ToShape.from(cluster: C3x4_OMOM_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_udu = ToShape.from(cluster: C3x4_OMRL_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_dud = ToShape.from(cluster: C3x4_OMRL_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_umd = ToShape.from(cluster: C3x4_OMRL_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_dmu = ToShape.from(cluster: C3x4_OMRL_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_dmo = ToShape.from(cluster: C3x4_OMRL_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_umo = ToShape.from(cluster: C3x4_OMRL_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_mom = ToShape.from(cluster: C3x4_OMRL_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_omu = ToShape.from(cluster: C3x4_OMRL_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_omd = ToShape.from(cluster: C3x4_OMRL_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omrl_omo = ToShape.from(cluster: C3x4_OMRL_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_udu = ToShape.from(cluster: C3x4_OMLR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_dud = ToShape.from(cluster: C3x4_OMLR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_umd = ToShape.from(cluster: C3x4_OMLR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_dmu = ToShape.from(cluster: C3x4_OMLR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_dmo = ToShape.from(cluster: C3x4_OMLR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_umo = ToShape.from(cluster: C3x4_OMLR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_mom = ToShape.from(cluster: C3x4_OMLR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_omu = ToShape.from(cluster: C3x4_OMLR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_omd = ToShape.from(cluster: C3x4_OMLR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omlr_omo = ToShape.from(cluster: C3x4_OMLR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        print("Cluster3x4")
        if lrlr_udu.count > 0 {
            print("LRLR_UDU: \(lrlr_udu.count)")
        }
        if lrlr_dud.count > 0 {
            print("LRLR_DUD: \(lrlr_dud.count)")
        }
        if lrlr_umd.count > 0 {
            print("LRLR_UMD: \(lrlr_umd.count)")
        }
        if lrlr_dmu.count > 0 {
            print("LRLR_DMU: \(lrlr_dmu.count)")
        }
        if lrlr_dmo.count > 0 {
            print("LRLR_DMO: \(lrlr_dmo.count)")
        }
        if lrlr_umo.count > 0 {
            print("LRLR_UMO: \(lrlr_umo.count)")
        }
        if lrlr_mom.count > 0 {
            print("LRLR_MOM: \(lrlr_mom.count)")
        }
        if lrlr_omu.count > 0 {
            print("LRLR_OMU: \(lrlr_omu.count)")
        }
        if lrlr_omd.count > 0 {
            print("LRLR_OMD: \(lrlr_omd.count)")
        }
        if lrlr_omo.count > 0 {
            print("LRLR_OMO: \(lrlr_omo.count)")
        }
        if rlrl_udu.count > 0 {
            print("RLRL_UDU: \(rlrl_udu.count)")
        }
        if rlrl_dud.count > 0 {
            print("RLRL_DUD: \(rlrl_dud.count)")
        }
        if rlrl_umd.count > 0 {
            print("RLRL_UMD: \(rlrl_umd.count)")
        }
        if rlrl_dmu.count > 0 {
            print("RLRL_DMU: \(rlrl_dmu.count)")
        }
        if rlrl_dmo.count > 0 {
            print("RLRL_DMO: \(rlrl_dmo.count)")
        }
        if rlrl_umo.count > 0 {
            print("RLRL_UMO: \(rlrl_umo.count)")
        }
        if rlrl_mom.count > 0 {
            print("RLRL_MOM: \(rlrl_mom.count)")
        }
        if rlrl_omu.count > 0 {
            print("RLRL_OMU: \(rlrl_omu.count)")
        }
        if rlrl_omd.count > 0 {
            print("RLRL_OMD: \(rlrl_omd.count)")
        }
        if rlrl_omo.count > 0 {
            print("RLRL_OMO: \(rlrl_omo.count)")
        }
        if lmrl_udu.count > 0 {
            print("LMRL_UDU: \(lmrl_udu.count)")
        }
        if lmrl_dud.count > 0 {
            print("LMRL_DUD: \(lmrl_dud.count)")
        }
        if lmrl_umd.count > 0 {
            print("LMRL_UMD: \(lmrl_umd.count)")
        }
        if lmrl_dmu.count > 0 {
            print("LMRL_DMU: \(lmrl_dmu.count)")
        }
        if lmrl_dmo.count > 0 {
            print("LMRL_DMO: \(lmrl_dmo.count)")
        }
        if lmrl_umo.count > 0 {
            print("LMRL_UMO: \(lmrl_umo.count)")
        }
        if lmrl_mom.count > 0 {
            print("LMRL_MOM: \(lmrl_mom.count)")
        }
        if lmrl_omu.count > 0 {
            print("LMRL_OMU: \(lmrl_omu.count)")
        }
        if lmrl_omd.count > 0 {
            print("LMRL_OMD: \(lmrl_omd.count)")
        }
        if lmrl_omo.count > 0 {
            print("LMRL_OMO: \(lmrl_omo.count)")
        }
        if lrml_udu.count > 0 {
            print("LRML_UDU: \(lrml_udu.count)")
        }
        if lrml_dud.count > 0 {
            print("LRML_DUD: \(lrml_dud.count)")
        }
        if lrml_umd.count > 0 {
            print("LRML_UMD: \(lrml_umd.count)")
        }
        if lrml_dmu.count > 0 {
            print("LRML_DMU: \(lrml_dmu.count)")
        }
        if lrml_dmo.count > 0 {
            print("LRML_DMO: \(lrml_dmo.count)")
        }
        if lrml_umo.count > 0 {
            print("LRML_UMO: \(lrml_umo.count)")
        }
        if lrml_mom.count > 0 {
            print("LRML_MOM: \(lrml_mom.count)")
        }
        if lrml_omu.count > 0 {
            print("LRML_OMU: \(lrml_omu.count)")
        }
        if lrml_omd.count > 0 {
            print("LRML_OMD: \(lrml_omd.count)")
        }
        if lrml_omo.count > 0 {
            print("LRML_OMO: \(lrml_omo.count)")
        }
        if rmlr_udu.count > 0 {
            print("RMLR_UDU: \(rmlr_udu.count)")
        }
        if rmlr_dud.count > 0 {
            print("RMLR_DUD: \(rmlr_dud.count)")
        }
        if rmlr_umd.count > 0 {
            print("RMLR_UMD: \(rmlr_umd.count)")
        }
        if rmlr_dmu.count > 0 {
            print("RMLR_DMU: \(rmlr_dmu.count)")
        }
        if rmlr_dmo.count > 0 {
            print("RMLR_DMO: \(rmlr_dmo.count)")
        }
        if rmlr_umo.count > 0 {
            print("RMLR_UMO: \(rmlr_umo.count)")
        }
        if rmlr_mom.count > 0 {
            print("RMLR_MOM: \(rmlr_mom.count)")
        }
        if rmlr_omu.count > 0 {
            print("RMLR_OMU: \(rmlr_omu.count)")
        }
        if rmlr_omd.count > 0 {
            print("RMLR_OMD: \(rmlr_omd.count)")
        }
        if rmlr_omo.count > 0 {
            print("RMLR_OMO: \(rmlr_omo.count)")
        }
        if rlmr_udu.count > 0 {
            print("RLMR_UDU: \(rlmr_udu.count)")
        }
        if rlmr_dud.count > 0 {
            print("RLMR_DUD: \(rlmr_dud.count)")
        }
        if rlmr_umd.count > 0 {
            print("RLMR_UMD: \(rlmr_umd.count)")
        }
        if rlmr_dmu.count > 0 {
            print("RLMR_DMU: \(rlmr_dmu.count)")
        }
        if rlmr_dmo.count > 0 {
            print("RLMR_DMO: \(rlmr_dmo.count)")
        }
        if rlmr_umo.count > 0 {
            print("RLMR_UMO: \(rlmr_umo.count)")
        }
        if rlmr_mom.count > 0 {
            print("RLMR_MOM: \(rlmr_mom.count)")
        }
        if rlmr_omu.count > 0 {
            print("RLMR_OMU: \(rlmr_omu.count)")
        }
        if rlmr_omd.count > 0 {
            print("RLMR_OMD: \(rlmr_omd.count)")
        }
        if rlmr_omo.count > 0 {
            print("RLMR_OMO: \(rlmr_omo.count)")
        }
        if lmom_udu.count > 0 {
            print("LMOM_UDU: \(lmom_udu.count)")
        }
        if lmom_dud.count > 0 {
            print("LMOM_DUD: \(lmom_dud.count)")
        }
        if lmom_umd.count > 0 {
            print("LMOM_UMD: \(lmom_umd.count)")
        }
        if lmom_dmu.count > 0 {
            print("LMOM_DMU: \(lmom_dmu.count)")
        }
        if lmom_dmo.count > 0 {
            print("LMOM_DMO: \(lmom_dmo.count)")
        }
        if lmom_umo.count > 0 {
            print("LMOM_UMO: \(lmom_umo.count)")
        }
        if lmom_mom.count > 0 {
            print("LMOM_MOM: \(lmom_mom.count)")
        }
        if lmom_omu.count > 0 {
            print("LMOM_OMU: \(lmom_omu.count)")
        }
        if lmom_omd.count > 0 {
            print("LMOM_OMD: \(lmom_omd.count)")
        }
        if lmom_omo.count > 0 {
            print("LMOM_OMO: \(lmom_omo.count)")
        }
        if lrmo_udu.count > 0 {
            print("LRMO_UDU: \(lrmo_udu.count)")
        }
        if lrmo_dud.count > 0 {
            print("LRMO_DUD: \(lrmo_dud.count)")
        }
        if lrmo_umd.count > 0 {
            print("LRMO_UMD: \(lrmo_umd.count)")
        }
        if lrmo_dmu.count > 0 {
            print("LRMO_DMU: \(lrmo_dmu.count)")
        }
        if lrmo_dmo.count > 0 {
            print("LRMO_DMO: \(lrmo_dmo.count)")
        }
        if lrmo_umo.count > 0 {
            print("LRMO_UMO: \(lrmo_umo.count)")
        }
        if lrmo_mom.count > 0 {
            print("LRMO_MOM: \(lrmo_mom.count)")
        }
        if lrmo_omu.count > 0 {
            print("LRMO_OMU: \(lrmo_omu.count)")
        }
        if lrmo_omd.count > 0 {
            print("LRMO_OMD: \(lrmo_omd.count)")
        }
        if lrmo_omo.count > 0 {
            print("LRMO_OMO: \(lrmo_omo.count)")
        }
        if rmom_udu.count > 0 {
            print("RMOM_UDU: \(rmom_udu.count)")
        }
        if rmom_dud.count > 0 {
            print("RMOM_DUD: \(rmom_dud.count)")
        }
        if rmom_umd.count > 0 {
            print("RMOM_UMD: \(rmom_umd.count)")
        }
        if rmom_dmu.count > 0 {
            print("RMOM_DMU: \(rmom_dmu.count)")
        }
        if rmom_dmo.count > 0 {
            print("RMOM_DMO: \(rmom_dmo.count)")
        }
        if rmom_umo.count > 0 {
            print("RMOM_UMO: \(rmom_umo.count)")
        }
        if rmom_mom.count > 0 {
            print("RMOM_MOM: \(rmom_mom.count)")
        }
        if rmom_omu.count > 0 {
            print("RMOM_OMU: \(rmom_omu.count)")
        }
        if rmom_omd.count > 0 {
            print("RMOM_OMD: \(rmom_omd.count)")
        }
        if rmom_omo.count > 0 {
            print("RMOM_OMO: \(rmom_omo.count)")
        }
        if rlmo_udu.count > 0 {
            print("RLMO_UDU: \(rlmo_udu.count)")
        }
        if rlmo_dud.count > 0 {
            print("RLMO_DUD: \(rlmo_dud.count)")
        }
        if rlmo_umd.count > 0 {
            print("RLMO_UMD: \(rlmo_umd.count)")
        }
        if rlmo_dmu.count > 0 {
            print("RLMO_DMU: \(rlmo_dmu.count)")
        }
        if rlmo_dmo.count > 0 {
            print("RLMO_DMO: \(rlmo_dmo.count)")
        }
        if rlmo_umo.count > 0 {
            print("RLMO_UMO: \(rlmo_umo.count)")
        }
        if rlmo_mom.count > 0 {
            print("RLMO_MOM: \(rlmo_mom.count)")
        }
        if rlmo_omu.count > 0 {
            print("RLMO_OMU: \(rlmo_omu.count)")
        }
        if rlmo_omd.count > 0 {
            print("RLMO_OMD: \(rlmo_omd.count)")
        }
        if rlmo_omo.count > 0 {
            print("RLMO_OMO: \(rlmo_omo.count)")
        }
        if moml_udu.count > 0 {
            print("MOML_UDU: \(moml_udu.count)")
        }
        if moml_dud.count > 0 {
            print("MOML_DUD: \(moml_dud.count)")
        }
        if moml_umd.count > 0 {
            print("MOML_UMD: \(moml_umd.count)")
        }
        if moml_dmu.count > 0 {
            print("MOML_DMU: \(moml_dmu.count)")
        }
        if moml_dmo.count > 0 {
            print("MOML_DMO: \(moml_dmo.count)")
        }
        if moml_umo.count > 0 {
            print("MOML_UMO: \(moml_umo.count)")
        }
        if moml_mom.count > 0 {
            print("MOML_MOM: \(moml_mom.count)")
        }
        if moml_omu.count > 0 {
            print("MOML_OMU: \(moml_omu.count)")
        }
        if moml_omd.count > 0 {
            print("MOML_OMD: \(moml_omd.count)")
        }
        if moml_omo.count > 0 {
            print("MOML_OMO: \(moml_omo.count)")
        }
        if momr_udu.count > 0 {
            print("MOMR_UDU: \(momr_udu.count)")
        }
        if momr_dud.count > 0 {
            print("MOMR_DUD: \(momr_dud.count)")
        }
        if momr_umd.count > 0 {
            print("MOMR_UMD: \(momr_umd.count)")
        }
        if momr_dmu.count > 0 {
            print("MOMR_DMU: \(momr_dmu.count)")
        }
        if momr_dmo.count > 0 {
            print("MOMR_DMO: \(momr_dmo.count)")
        }
        if momr_umo.count > 0 {
            print("MOMR_UMO: \(momr_umo.count)")
        }
        if momr_mom.count > 0 {
            print("MOMR_MOM: \(momr_mom.count)")
        }
        if momr_omu.count > 0 {
            print("MOMR_OMU: \(momr_omu.count)")
        }
        if momr_omd.count > 0 {
            print("MOMR_OMD: \(momr_omd.count)")
        }
        if momr_omo.count > 0 {
            print("MOMR_OMO: \(momr_omo.count)")
        }
        if momo_udu.count > 0 {
            print("MOMO_UDU: \(momo_udu.count)")
        }
        if momo_dud.count > 0 {
            print("MOMO_DUD: \(momo_dud.count)")
        }
        if momo_umd.count > 0 {
            print("MOMO_UMD: \(momo_umd.count)")
        }
        if momo_dmu.count > 0 {
            print("MOMO_DMU: \(momo_dmu.count)")
        }
        if momo_dmo.count > 0 {
            print("MOMO_DMO: \(momo_dmo.count)")
        }
        if momo_umo.count > 0 {
            print("MOMO_UMO: \(momo_umo.count)")
        }
        if momo_mom.count > 0 {
            print("MOMO_MOM: \(momo_mom.count)")
        }
        if momo_omu.count > 0 {
            print("MOMO_OMU: \(momo_omu.count)")
        }
        if momo_omd.count > 0 {
            print("MOMO_OMD: \(momo_omd.count)")
        }
        if momo_omo.count > 0 {
            print("MOMO_OMO: \(momo_omo.count)")
        }
        if omom_udu.count > 0 {
            print("OMOM_UDU: \(omom_udu.count)")
        }
        if omom_dud.count > 0 {
            print("OMOM_DUD: \(omom_dud.count)")
        }
        if omom_umd.count > 0 {
            print("OMOM_UMD: \(omom_umd.count)")
        }
        if omom_dmu.count > 0 {
            print("OMOM_DMU: \(omom_dmu.count)")
        }
        if omom_dmo.count > 0 {
            print("OMOM_DMO: \(omom_dmo.count)")
        }
        if omom_umo.count > 0 {
            print("OMOM_UMO: \(omom_umo.count)")
        }
        if omom_mom.count > 0 {
            print("OMOM_MOM: \(omom_mom.count)")
        }
        if omom_omu.count > 0 {
            print("OMOM_OMU: \(omom_omu.count)")
        }
        if omom_omd.count > 0 {
            print("OMOM_OMD: \(omom_omd.count)")
        }
        if omom_omo.count > 0 {
            print("OMOM_OMO: \(omom_omo.count)")
        }
        if omrl_udu.count > 0 {
            print("OMRL_UDU: \(omrl_udu.count)")
        }
        if omrl_dud.count > 0 {
            print("OMRL_DUD: \(omrl_dud.count)")
        }
        if omrl_umd.count > 0 {
            print("OMRL_UMD: \(omrl_umd.count)")
        }
        if omrl_dmu.count > 0 {
            print("OMRL_DMU: \(omrl_dmu.count)")
        }
        if omrl_dmo.count > 0 {
            print("OMRL_DMO: \(omrl_dmo.count)")
        }
        if omrl_umo.count > 0 {
            print("OMRL_UMO: \(omrl_umo.count)")
        }
        if omrl_mom.count > 0 {
            print("OMRL_MOM: \(omrl_mom.count)")
        }
        if omrl_omu.count > 0 {
            print("OMRL_OMU: \(omrl_omu.count)")
        }
        if omrl_omd.count > 0 {
            print("OMRL_OMD: \(omrl_omd.count)")
        }
        if omrl_omo.count > 0 {
            print("OMRL_OMO: \(omrl_omo.count)")
        }
        if omlr_udu.count > 0 {
            print("OMLR_UDU: \(omlr_udu.count)")
        }
        if omlr_dud.count > 0 {
            print("OMLR_DUD: \(omlr_dud.count)")
        }
        if omlr_umd.count > 0 {
            print("OMLR_UMD: \(omlr_umd.count)")
        }
        if omlr_dmu.count > 0 {
            print("OMLR_DMU: \(omlr_dmu.count)")
        }
        if omlr_dmo.count > 0 {
            print("OMLR_DMO: \(omlr_dmo.count)")
        }
        if omlr_umo.count > 0 {
            print("OMLR_UMO: \(omlr_umo.count)")
        }
        if omlr_mom.count > 0 {
            print("OMLR_MOM: \(omlr_mom.count)")
        }
        if omlr_omu.count > 0 {
            print("OMLR_OMU: \(omlr_omu.count)")
        }
        if omlr_omd.count > 0 {
            print("OMLR_OMD: \(omlr_omd.count)")
        }
        if omlr_omo.count > 0 {
            print("OMLR_OMO: \(omlr_omo.count)")
        }

        let result = lrlr_udu + lrlr_dud + lrlr_umd + lrlr_dmu + lrlr_dmo + lrlr_umo + lrlr_mom + lrlr_omu + lrlr_omd + lrlr_omo + rlrl_udu + rlrl_dud + rlrl_umd + rlrl_dmu + rlrl_dmo + rlrl_umo + rlrl_mom + rlrl_omu + rlrl_omd + rlrl_omo + lmrl_udu + lmrl_dud + lmrl_umd + lmrl_dmu + lmrl_dmo + lmrl_umo + lmrl_mom + lmrl_omu + lmrl_omd + lmrl_omo + lrml_udu + lrml_dud + lrml_umd + lrml_dmu + lrml_dmo + lrml_umo + lrml_mom + lrml_omu + lrml_omd + lrml_omo + rmlr_udu + rmlr_dud + rmlr_umd + rmlr_dmu + rmlr_dmo + rmlr_umo + rmlr_mom + rmlr_omu + rmlr_omd + rmlr_omo + rlmr_udu + rlmr_dud + rlmr_umd + rlmr_dmu + rlmr_dmo + rlmr_umo + rlmr_mom + rlmr_omu + rlmr_omd + rlmr_omo + lmom_udu + lmom_dud + lmom_umd + lmom_dmu + lmom_dmo + lmom_umo + lmom_mom + lmom_omu + lmom_omd + lmom_omo + lrmo_udu + lrmo_dud + lrmo_umd + lrmo_dmu + lrmo_dmo + lrmo_umo + lrmo_mom + lrmo_omu + lrmo_omd + lrmo_omo + rmom_udu + rmom_dud + rmom_umd + rmom_dmu + rmom_dmo + rmom_umo + rmom_mom + rmom_omu + rmom_omd + rmom_omo + rlmo_udu + rlmo_dud + rlmo_umd + rlmo_dmu + rlmo_dmo + rlmo_umo + rlmo_mom + rlmo_omu + rlmo_omd + rlmo_omo + moml_udu + moml_dud + moml_umd + moml_dmu + moml_dmo + moml_umo + moml_mom + moml_omu + moml_omd + moml_omo + momr_udu + momr_dud + momr_umd + momr_dmu + momr_dmo + momr_umo + momr_mom + momr_omu + momr_omd + momr_omo + momo_udu + momo_dud + momo_umd + momo_dmu + momo_dmo + momo_umo + momo_mom + momo_omu + momo_omd + momo_omo + omom_udu + omom_dud + omom_umd + omom_dmu + omom_dmo + omom_umo + omom_mom + omom_omu + omom_omd + omom_omo + omrl_udu + omrl_dud + omrl_umd + omrl_dmu + omrl_dmo + omrl_umo + omrl_mom + omrl_omu + omrl_omd + omrl_omo + omlr_udu + omlr_dud + omlr_umd + omlr_dmu + omlr_dmo + omlr_umo + omlr_mom + omlr_omu + omlr_omd + omlr_omo
        return result
    }
}