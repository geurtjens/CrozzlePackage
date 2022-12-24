public class C2x3 {
    static func Execute(w: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        let wordCount = w.wordCount

        let lrl_ud = ToShape.from(cluster: C2x3_LRL_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_du = ToShape.from(cluster: C2x3_LRL_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_mo = ToShape.from(cluster: C2x3_LRL_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrl_om = ToShape.from(cluster: C2x3_LRL_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_ud = ToShape.from(cluster: C2x3_RLR_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_du = ToShape.from(cluster: C2x3_RLR_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_mo = ToShape.from(cluster: C2x3_RLR_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlr_om = ToShape.from(cluster: C2x3_RLR_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        print("Cluster2x3")
        if lrl_ud.count > 0 {
            print("LRL_UD: \(lrl_ud.count)")
        }
        if lrl_du.count > 0 {
            print("LRL_DU: \(lrl_du.count)")
        }
        if lrl_mo.count > 0 {
            print("LRL_MO: \(lrl_mo.count)")
        }
        if lrl_om.count > 0 {
            print("LRL_OM: \(lrl_om.count)")
        }
        if rlr_ud.count > 0 {
            print("RLR_UD: \(rlr_ud.count)")
        }
        if rlr_du.count > 0 {
            print("RLR_DU: \(rlr_du.count)")
        }
        if rlr_mo.count > 0 {
            print("RLR_MO: \(rlr_mo.count)")
        }
        if rlr_om.count > 0 {
            print("RLR_OM: \(rlr_om.count)")
        }

        let result = lrl_ud + lrl_du + lrl_mo + lrl_om + rlr_ud + rlr_du + rlr_mo + rlr_om
        return result
    }
}