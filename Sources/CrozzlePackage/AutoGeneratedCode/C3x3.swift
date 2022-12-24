public class C3x3 {
    static func Execute(w: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        let wordCount = w.wordCount

        let lrl_udu = ToShape.from(cluster: C3x3_LRL_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_dud = ToShape.from(cluster: C3x3_LRL_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_umd = ToShape.from(cluster: C3x3_LRL_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_dmu = ToShape.from(cluster: C3x3_LRL_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_dmo = ToShape.from(cluster: C3x3_LRL_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_umo = ToShape.from(cluster: C3x3_LRL_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_mom = ToShape.from(cluster: C3x3_LRL_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_omu = ToShape.from(cluster: C3x3_LRL_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_omd = ToShape.from(cluster: C3x3_LRL_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_omo = ToShape.from(cluster: C3x3_LRL_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_udu = ToShape.from(cluster: C3x3_RLR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_dud = ToShape.from(cluster: C3x3_RLR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_umd = ToShape.from(cluster: C3x3_RLR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_dmu = ToShape.from(cluster: C3x3_RLR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_dmo = ToShape.from(cluster: C3x3_RLR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_umo = ToShape.from(cluster: C3x3_RLR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_mom = ToShape.from(cluster: C3x3_RLR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_omu = ToShape.from(cluster: C3x3_RLR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_omd = ToShape.from(cluster: C3x3_RLR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_omo = ToShape.from(cluster: C3x3_RLR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_udu = ToShape.from(cluster: C3x3_LMR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_dud = ToShape.from(cluster: C3x3_LMR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_umd = ToShape.from(cluster: C3x3_LMR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_dmu = ToShape.from(cluster: C3x3_LMR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_dmo = ToShape.from(cluster: C3x3_LMR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_umo = ToShape.from(cluster: C3x3_LMR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_mom = ToShape.from(cluster: C3x3_LMR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_omu = ToShape.from(cluster: C3x3_LMR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_omd = ToShape.from(cluster: C3x3_LMR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmr_omo = ToShape.from(cluster: C3x3_LMR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_udu = ToShape.from(cluster: C3x3_RML_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_dud = ToShape.from(cluster: C3x3_RML_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_umd = ToShape.from(cluster: C3x3_RML_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_dmu = ToShape.from(cluster: C3x3_RML_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_dmo = ToShape.from(cluster: C3x3_RML_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_umo = ToShape.from(cluster: C3x3_RML_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_mom = ToShape.from(cluster: C3x3_RML_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_omu = ToShape.from(cluster: C3x3_RML_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_omd = ToShape.from(cluster: C3x3_RML_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rml_omo = ToShape.from(cluster: C3x3_RML_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_udu = ToShape.from(cluster: C3x3_LMO_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_dud = ToShape.from(cluster: C3x3_LMO_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_umd = ToShape.from(cluster: C3x3_LMO_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_dmu = ToShape.from(cluster: C3x3_LMO_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_umo = ToShape.from(cluster: C3x3_LMO_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_mom = ToShape.from(cluster: C3x3_LMO_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_omu = ToShape.from(cluster: C3x3_LMO_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_omd = ToShape.from(cluster: C3x3_LMO_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lmo_omo = ToShape.from(cluster: C3x3_LMO_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_udu = ToShape.from(cluster: C3x3_RMO_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_dud = ToShape.from(cluster: C3x3_RMO_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_umd = ToShape.from(cluster: C3x3_RMO_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_dmu = ToShape.from(cluster: C3x3_RMO_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_dmo = ToShape.from(cluster: C3x3_RMO_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_umo = ToShape.from(cluster: C3x3_RMO_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_mom = ToShape.from(cluster: C3x3_RMO_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_omu = ToShape.from(cluster: C3x3_RMO_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_omd = ToShape.from(cluster: C3x3_RMO_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rmo_omo = ToShape.from(cluster: C3x3_RMO_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_udu = ToShape.from(cluster: C3x3_MOM_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_dud = ToShape.from(cluster: C3x3_MOM_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_umd = ToShape.from(cluster: C3x3_MOM_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_dmu = ToShape.from(cluster: C3x3_MOM_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_dmo = ToShape.from(cluster: C3x3_MOM_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_umo = ToShape.from(cluster: C3x3_MOM_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_mom = ToShape.from(cluster: C3x3_MOM_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_omu = ToShape.from(cluster: C3x3_MOM_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_omd = ToShape.from(cluster: C3x3_MOM_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let mom_omo = ToShape.from(cluster: C3x3_MOM_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_udu = ToShape.from(cluster: C3x3_OML_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_dud = ToShape.from(cluster: C3x3_OML_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_umd = ToShape.from(cluster: C3x3_OML_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_dmu = ToShape.from(cluster: C3x3_OML_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_dmo = ToShape.from(cluster: C3x3_OML_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_umo = ToShape.from(cluster: C3x3_OML_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_mom = ToShape.from(cluster: C3x3_OML_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_omu = ToShape.from(cluster: C3x3_OML_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_omd = ToShape.from(cluster: C3x3_OML_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let oml_omo = ToShape.from(cluster: C3x3_OML_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_udu = ToShape.from(cluster: C3x3_OMR_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_dud = ToShape.from(cluster: C3x3_OMR_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_umd = ToShape.from(cluster: C3x3_OMR_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_dmu = ToShape.from(cluster: C3x3_OMR_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_dmo = ToShape.from(cluster: C3x3_OMR_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_umo = ToShape.from(cluster: C3x3_OMR_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_mom = ToShape.from(cluster: C3x3_OMR_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_omu = ToShape.from(cluster: C3x3_OMR_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_omd = ToShape.from(cluster: C3x3_OMR_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omr_omo = ToShape.from(cluster: C3x3_OMR_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_udu = ToShape.from(cluster: C3x3_OMO_UDU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_dud = ToShape.from(cluster: C3x3_OMO_DUD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_umd = ToShape.from(cluster: C3x3_OMO_UMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_dmu = ToShape.from(cluster: C3x3_OMO_DMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_dmo = ToShape.from(cluster: C3x3_OMO_DMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_umo = ToShape.from(cluster: C3x3_OMO_UMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_mom = ToShape.from(cluster: C3x3_OMO_MOM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_omu = ToShape.from(cluster: C3x3_OMO_OMU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_omd = ToShape.from(cluster: C3x3_OMO_OMD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let omo_omo = ToShape.from(cluster: C3x3_OMO_OMO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        print("Cluster3x3")
        if lrl_udu.count > 0 {
            print("LRL_UDU: \(lrl_udu.count)")
        }
        if lrl_dud.count > 0 {
            print("LRL_DUD: \(lrl_dud.count)")
        }
        if lrl_umd.count > 0 {
            print("LRL_UMD: \(lrl_umd.count)")
        }
        if lrl_dmu.count > 0 {
            print("LRL_DMU: \(lrl_dmu.count)")
        }
        if lrl_dmo.count > 0 {
            print("LRL_DMO: \(lrl_dmo.count)")
        }
        if lrl_umo.count > 0 {
            print("LRL_UMO: \(lrl_umo.count)")
        }
        if lrl_mom.count > 0 {
            print("LRL_MOM: \(lrl_mom.count)")
        }
        if lrl_omu.count > 0 {
            print("LRL_OMU: \(lrl_omu.count)")
        }
        if lrl_omd.count > 0 {
            print("LRL_OMD: \(lrl_omd.count)")
        }
        if lrl_omo.count > 0 {
            print("LRL_OMO: \(lrl_omo.count)")
        }
        if rlr_udu.count > 0 {
            print("RLR_UDU: \(rlr_udu.count)")
        }
        if rlr_dud.count > 0 {
            print("RLR_DUD: \(rlr_dud.count)")
        }
        if rlr_umd.count > 0 {
            print("RLR_UMD: \(rlr_umd.count)")
        }
        if rlr_dmu.count > 0 {
            print("RLR_DMU: \(rlr_dmu.count)")
        }
        if rlr_dmo.count > 0 {
            print("RLR_DMO: \(rlr_dmo.count)")
        }
        if rlr_umo.count > 0 {
            print("RLR_UMO: \(rlr_umo.count)")
        }
        if rlr_mom.count > 0 {
            print("RLR_MOM: \(rlr_mom.count)")
        }
        if rlr_omu.count > 0 {
            print("RLR_OMU: \(rlr_omu.count)")
        }
        if rlr_omd.count > 0 {
            print("RLR_OMD: \(rlr_omd.count)")
        }
        if rlr_omo.count > 0 {
            print("RLR_OMO: \(rlr_omo.count)")
        }
        if lmr_udu.count > 0 {
            print("LMR_UDU: \(lmr_udu.count)")
        }
        if lmr_dud.count > 0 {
            print("LMR_DUD: \(lmr_dud.count)")
        }
        if lmr_umd.count > 0 {
            print("LMR_UMD: \(lmr_umd.count)")
        }
        if lmr_dmu.count > 0 {
            print("LMR_DMU: \(lmr_dmu.count)")
        }
        if lmr_dmo.count > 0 {
            print("LMR_DMO: \(lmr_dmo.count)")
        }
        if lmr_umo.count > 0 {
            print("LMR_UMO: \(lmr_umo.count)")
        }
        if lmr_mom.count > 0 {
            print("LMR_MOM: \(lmr_mom.count)")
        }
        if lmr_omu.count > 0 {
            print("LMR_OMU: \(lmr_omu.count)")
        }
        if lmr_omd.count > 0 {
            print("LMR_OMD: \(lmr_omd.count)")
        }
        if lmr_omo.count > 0 {
            print("LMR_OMO: \(lmr_omo.count)")
        }
        if rml_udu.count > 0 {
            print("RML_UDU: \(rml_udu.count)")
        }
        if rml_dud.count > 0 {
            print("RML_DUD: \(rml_dud.count)")
        }
        if rml_umd.count > 0 {
            print("RML_UMD: \(rml_umd.count)")
        }
        if rml_dmu.count > 0 {
            print("RML_DMU: \(rml_dmu.count)")
        }
        if rml_dmo.count > 0 {
            print("RML_DMO: \(rml_dmo.count)")
        }
        if rml_umo.count > 0 {
            print("RML_UMO: \(rml_umo.count)")
        }
        if rml_mom.count > 0 {
            print("RML_MOM: \(rml_mom.count)")
        }
        if rml_omu.count > 0 {
            print("RML_OMU: \(rml_omu.count)")
        }
        if rml_omd.count > 0 {
            print("RML_OMD: \(rml_omd.count)")
        }
        if rml_omo.count > 0 {
            print("RML_OMO: \(rml_omo.count)")
        }
        if lmo_udu.count > 0 {
            print("LMO_UDU: \(lmo_udu.count)")
        }
        if lmo_dud.count > 0 {
            print("LMO_DUD: \(lmo_dud.count)")
        }
        if lmo_umd.count > 0 {
            print("LMO_UMD: \(lmo_umd.count)")
        }
        if lmo_dmu.count > 0 {
            print("LMO_DMU: \(lmo_dmu.count)")
        }
        if lmo_umo.count > 0 {
            print("LMO_UMO: \(lmo_umo.count)")
        }
        if lmo_mom.count > 0 {
            print("LMO_MOM: \(lmo_mom.count)")
        }
        if lmo_omu.count > 0 {
            print("LMO_OMU: \(lmo_omu.count)")
        }
        if lmo_omd.count > 0 {
            print("LMO_OMD: \(lmo_omd.count)")
        }
        if lmo_omo.count > 0 {
            print("LMO_OMO: \(lmo_omo.count)")
        }
        if rmo_udu.count > 0 {
            print("RMO_UDU: \(rmo_udu.count)")
        }
        if rmo_dud.count > 0 {
            print("RMO_DUD: \(rmo_dud.count)")
        }
        if rmo_umd.count > 0 {
            print("RMO_UMD: \(rmo_umd.count)")
        }
        if rmo_dmu.count > 0 {
            print("RMO_DMU: \(rmo_dmu.count)")
        }
        if rmo_dmo.count > 0 {
            print("RMO_DMO: \(rmo_dmo.count)")
        }
        if rmo_umo.count > 0 {
            print("RMO_UMO: \(rmo_umo.count)")
        }
        if rmo_mom.count > 0 {
            print("RMO_MOM: \(rmo_mom.count)")
        }
        if rmo_omu.count > 0 {
            print("RMO_OMU: \(rmo_omu.count)")
        }
        if rmo_omd.count > 0 {
            print("RMO_OMD: \(rmo_omd.count)")
        }
        if rmo_omo.count > 0 {
            print("RMO_OMO: \(rmo_omo.count)")
        }
        if mom_udu.count > 0 {
            print("MOM_UDU: \(mom_udu.count)")
        }
        if mom_dud.count > 0 {
            print("MOM_DUD: \(mom_dud.count)")
        }
        if mom_umd.count > 0 {
            print("MOM_UMD: \(mom_umd.count)")
        }
        if mom_dmu.count > 0 {
            print("MOM_DMU: \(mom_dmu.count)")
        }
        if mom_dmo.count > 0 {
            print("MOM_DMO: \(mom_dmo.count)")
        }
        if mom_umo.count > 0 {
            print("MOM_UMO: \(mom_umo.count)")
        }
        if mom_mom.count > 0 {
            print("MOM_MOM: \(mom_mom.count)")
        }
        if mom_omu.count > 0 {
            print("MOM_OMU: \(mom_omu.count)")
        }
        if mom_omd.count > 0 {
            print("MOM_OMD: \(mom_omd.count)")
        }
        if mom_omo.count > 0 {
            print("MOM_OMO: \(mom_omo.count)")
        }
        if oml_udu.count > 0 {
            print("OML_UDU: \(oml_udu.count)")
        }
        if oml_dud.count > 0 {
            print("OML_DUD: \(oml_dud.count)")
        }
        if oml_umd.count > 0 {
            print("OML_UMD: \(oml_umd.count)")
        }
        if oml_dmu.count > 0 {
            print("OML_DMU: \(oml_dmu.count)")
        }
        if oml_dmo.count > 0 {
            print("OML_DMO: \(oml_dmo.count)")
        }
        if oml_umo.count > 0 {
            print("OML_UMO: \(oml_umo.count)")
        }
        if oml_mom.count > 0 {
            print("OML_MOM: \(oml_mom.count)")
        }
        if oml_omu.count > 0 {
            print("OML_OMU: \(oml_omu.count)")
        }
        if oml_omd.count > 0 {
            print("OML_OMD: \(oml_omd.count)")
        }
        if oml_omo.count > 0 {
            print("OML_OMO: \(oml_omo.count)")
        }
        if omr_udu.count > 0 {
            print("OMR_UDU: \(omr_udu.count)")
        }
        if omr_dud.count > 0 {
            print("OMR_DUD: \(omr_dud.count)")
        }
        if omr_umd.count > 0 {
            print("OMR_UMD: \(omr_umd.count)")
        }
        if omr_dmu.count > 0 {
            print("OMR_DMU: \(omr_dmu.count)")
        }
        if omr_dmo.count > 0 {
            print("OMR_DMO: \(omr_dmo.count)")
        }
        if omr_umo.count > 0 {
            print("OMR_UMO: \(omr_umo.count)")
        }
        if omr_mom.count > 0 {
            print("OMR_MOM: \(omr_mom.count)")
        }
        if omr_omu.count > 0 {
            print("OMR_OMU: \(omr_omu.count)")
        }
        if omr_omd.count > 0 {
            print("OMR_OMD: \(omr_omd.count)")
        }
        if omr_omo.count > 0 {
            print("OMR_OMO: \(omr_omo.count)")
        }
        if omo_udu.count > 0 {
            print("OMO_UDU: \(omo_udu.count)")
        }
        if omo_dud.count > 0 {
            print("OMO_DUD: \(omo_dud.count)")
        }
        if omo_umd.count > 0 {
            print("OMO_UMD: \(omo_umd.count)")
        }
        if omo_dmu.count > 0 {
            print("OMO_DMU: \(omo_dmu.count)")
        }
        if omo_dmo.count > 0 {
            print("OMO_DMO: \(omo_dmo.count)")
        }
        if omo_umo.count > 0 {
            print("OMO_UMO: \(omo_umo.count)")
        }
        if omo_mom.count > 0 {
            print("OMO_MOM: \(omo_mom.count)")
        }
        if omo_omu.count > 0 {
            print("OMO_OMU: \(omo_omu.count)")
        }
        if omo_omd.count > 0 {
            print("OMO_OMD: \(omo_omd.count)")
        }
        if omo_omo.count > 0 {
            print("OMO_OMO: \(omo_omo.count)")
        }

        let result = lrl_udu + lrl_dud + lrl_umd + lrl_dmu + lrl_dmo + lrl_umo + lrl_mom + lrl_omu + lrl_omd + lrl_omo + rlr_udu + rlr_dud + rlr_umd + rlr_dmu + rlr_dmo + rlr_umo + rlr_mom + rlr_omu + rlr_omd + rlr_omo + lmr_udu + lmr_dud + lmr_umd + lmr_dmu + lmr_dmo + lmr_umo + lmr_mom + lmr_omu + lmr_omd + lmr_omo + rml_udu + rml_dud + rml_umd + rml_dmu + rml_dmo + rml_umo + rml_mom + rml_omu + rml_omd + rml_omo + lmo_udu + lmo_dud + lmo_umd + lmo_dmu + lmo_umo + lmo_mom + lmo_omu + lmo_omd + lmo_omo + rmo_udu + rmo_dud + rmo_umd + rmo_dmu + rmo_dmo + rmo_umo + rmo_mom + rmo_omu + rmo_omd + rmo_omo + mom_udu + mom_dud + mom_umd + mom_dmu + mom_dmo + mom_umo + mom_mom + mom_omu + mom_omd + mom_omo + oml_udu + oml_dud + oml_umd + oml_dmu + oml_dmo + oml_umo + oml_mom + oml_omu + oml_omd + oml_omo + omr_udu + omr_dud + omr_umd + omr_dmu + omr_dmo + omr_umo + omr_mom + omr_omu + omr_omd + omr_omo + omo_udu + omo_dud + omo_umd + omo_dmu + omo_dmo + omo_umo + omo_mom + omo_omu + omo_omd + omo_omo
        return result
    }
}