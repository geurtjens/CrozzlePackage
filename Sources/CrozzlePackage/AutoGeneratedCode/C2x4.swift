public class C2x4 {
    static func Execute(w: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        let wordCount = w.wordCount

        let lrlr_ud = ToShape.from(cluster: C2x4_LRLR_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_du = ToShape.from(cluster: C2x4_LRLR_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_mo = ToShape.from(cluster: C2x4_LRLR_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlr_om = ToShape.from(cluster: C2x4_LRLR_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_ud = ToShape.from(cluster: C2x4_RLRL_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_du = ToShape.from(cluster: C2x4_RLRL_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_mo = ToShape.from(cluster: C2x4_RLRL_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrl_om = ToShape.from(cluster: C2x4_RLRL_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        print("Cluster2x4")
        if lrlr_ud.count > 0 {
            print("LRLR_UD: \(lrlr_ud.count)")
        }
        if lrlr_du.count > 0 {
            print("LRLR_DU: \(lrlr_du.count)")
        }
        if lrlr_mo.count > 0 {
            print("LRLR_MO: \(lrlr_mo.count)")
        }
        if lrlr_om.count > 0 {
            print("LRLR_OM: \(lrlr_om.count)")
        }
        if rlrl_ud.count > 0 {
            print("RLRL_UD: \(rlrl_ud.count)")
        }
        if rlrl_du.count > 0 {
            print("RLRL_DU: \(rlrl_du.count)")
        }
        if rlrl_mo.count > 0 {
            print("RLRL_MO: \(rlrl_mo.count)")
        }
        if rlrl_om.count > 0 {
            print("RLRL_OM: \(rlrl_om.count)")
        }

        let result = lrlr_ud + lrlr_du + lrlr_mo + lrlr_om + rlrl_ud + rlrl_du + rlrl_mo + rlrl_om
        return result
    }
}