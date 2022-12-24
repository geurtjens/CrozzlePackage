public class C2x2 {
    static func Execute(w: WordModelSOA, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        let wordCount = w.wordCount

        let lr_ud = ToShape.from(cluster: C2x2_LR_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rl_ud = ToShape.from(cluster: C2x2_RL_UD.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let rl_du = ToShape.from(cluster: C2x2_RL_DU.Execute(W: w, wordCount: wordCount), wordList: w, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        print("Cluster2x2")
        if lr_ud.count > 0 {
            print("LR_UD: \(lr_ud.count)")
        }
        if rl_ud.count > 0 {
            print("RL_UD: \(rl_ud.count)")
        }
        if rl_du.count > 0 {
            print("RL_DU: \(rl_du.count)")
        }

        let result = lr_ud + rl_ud + rl_du
        return result
    }
}