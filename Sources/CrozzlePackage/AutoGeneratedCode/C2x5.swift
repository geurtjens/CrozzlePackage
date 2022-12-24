public class C2x5 {
    static func Execute(w: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        let wordCount = w.wordCount

        let lrlrl_ud = ToShape.from(cluster: C2x5_LRLRL_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlrl_du = ToShape.from(cluster: C2x5_LRLRL_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlrl_mo = ToShape.from(cluster: C2x5_LRLRL_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlrl_om = ToShape.from(cluster: C2x5_LRLRL_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlr_ud = ToShape.from(cluster: C2x5_RLRLR_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlr_du = ToShape.from(cluster: C2x5_RLRLR_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlr_mo = ToShape.from(cluster: C2x5_RLRLR_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlr_om = ToShape.from(cluster: C2x5_RLRLR_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        print("Cluster2x5")
        if lrlrl_ud.count > 0 {
            print("LRLRL_UD: \(lrlrl_ud.count)")
        }
        if lrlrl_du.count > 0 {
            print("LRLRL_DU: \(lrlrl_du.count)")
        }
        if lrlrl_mo.count > 0 {
            print("LRLRL_MO: \(lrlrl_mo.count)")
        }
        if lrlrl_om.count > 0 {
            print("LRLRL_OM: \(lrlrl_om.count)")
        }
        if rlrlr_ud.count > 0 {
            print("RLRLR_UD: \(rlrlr_ud.count)")
        }
        if rlrlr_du.count > 0 {
            print("RLRLR_DU: \(rlrlr_du.count)")
        }
        if rlrlr_mo.count > 0 {
            print("RLRLR_MO: \(rlrlr_mo.count)")
        }
        if rlrlr_om.count > 0 {
            print("RLRLR_OM: \(rlrlr_om.count)")
        }

        let result = lrlrl_ud + lrlrl_du + lrlrl_mo + lrlrl_om + rlrlr_ud + rlrlr_du + rlrlr_mo + rlrlr_om
        return result
    }
}