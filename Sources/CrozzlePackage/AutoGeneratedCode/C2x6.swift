public class C2x6 {
    static func Execute(w: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        let wordCount = w.wordCount

        let lrlrlr_ud = ToShape.from(cluster: C2x6_LRLRLR_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlrlr_du = ToShape.from(cluster: C2x6_LRLRLR_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlrlr_mo = ToShape.from(cluster: C2x6_LRLRLR_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let lrlrlr_om = ToShape.from(cluster: C2x6_LRLRLR_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlrl_ud = ToShape.from(cluster: C2x6_RLRLRL_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlrl_du = ToShape.from(cluster: C2x6_RLRLRL_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlrl_mo = ToShape.from(cluster: C2x6_RLRLRL_MO.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rlrlrl_om = ToShape.from(cluster: C2x6_RLRLRL_OM.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        print("Cluster2x6")
        if lrlrlr_ud.count > 0 {
            print("LRLRLR_UD: \(lrlrlr_ud.count)")
        }
        if lrlrlr_du.count > 0 {
            print("LRLRLR_DU: \(lrlrlr_du.count)")
        }
        if lrlrlr_mo.count > 0 {
            print("LRLRLR_MO: \(lrlrlr_mo.count)")
        }
        if lrlrlr_om.count > 0 {
            print("LRLRLR_OM: \(lrlrlr_om.count)")
        }
        if rlrlrl_ud.count > 0 {
            print("RLRLRL_UD: \(rlrlrl_ud.count)")
        }
        if rlrlrl_du.count > 0 {
            print("RLRLRL_DU: \(rlrlrl_du.count)")
        }
        if rlrlrl_mo.count > 0 {
            print("RLRLRL_MO: \(rlrlrl_mo.count)")
        }
        if rlrlrl_om.count > 0 {
            print("RLRLRL_OM: \(rlrlrl_om.count)")
        }

        let result = lrlrlr_ud + lrlrlr_du + lrlrlr_mo + lrlrlr_om + rlrlrl_ud + rlrlrl_du + rlrlrl_mo + rlrlrl_om
        return result
    }
}