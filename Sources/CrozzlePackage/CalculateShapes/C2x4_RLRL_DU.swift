public class C2x4_RLRL_DU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 2
        let interlockHeight = 4
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }

            for down1 in 0..<wordCount {

                if (W.Len[down1] >= interlockHeight) {
                    //print("down1:\(W.Start[down1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.Start[down1][0] &&
                            W.Id[right1] != W.Id[down1]) {
                            //print("right1:\(W.Start[right1])")

                            for up2 in 0..<wordCount {

                                if (W.Len[up2] >= interlockHeight &&
                                    W.End[up2][3] == W.Start[right1][1] &&
                                    W.Id[up2] != W.Id[right1] &&
                                    W.Id[up2] != W.Id[down1]) {
                                    //print("up2:\(W.Start[up2])")

                                    for left2 in 0..<wordCount {

                                        if (W.Len[left2] >= interlockWidth &&
                                            W.End[left2][1] == W.Start[down1][1] &&
                                            W.End[left2][0] == W.End[up2][2] &&
                                            W.Id[left2] != W.Id[up2] &&
                                            W.Id[left2] != W.Id[right1] &&
                                            W.Id[left2] != W.Id[down1]) {
                                            //print("left2:\(W.Start[left2])")

                                            for right3 in 0..<wordCount {

                                                if (W.Len[right3] >= interlockWidth &&
                                                    W.Start[right3][0] == W.Start[down1][2] &&
                                                    W.Start[right3][1] == W.End[up2][1] &&
                                                    W.Id[right3] != W.Id[left2] &&
                                                    W.Id[right3] != W.Id[up2] &&
                                                    W.Id[right3] != W.Id[right1] &&
                                                    W.Id[right3] != W.Id[down1]) {
                                                    //print("right3:\(W.Start[right3])")

                                                    for left4 in 0..<wordCount {

                                                        if (W.Len[left4] >= interlockWidth &&
                                                            W.End[left4][1] == W.Start[down1][3] &&
                                                            W.End[left4][0] == W.End[up2][0] &&
                                                            W.Id[left4] != W.Id[right3] &&
                                                            W.Id[left4] != W.Id[left2] &&
                                                            W.Id[left4] != W.Id[up2] &&
                                                            W.Id[left4] != W.Id[right1] &&
                                                            W.Id[left4] != W.Id[down1]) {
                                                            //print("left4:\(W.Start[left4])")

                                                            if phase == 0 {
                                                                shapeCount += 1
                                                            }
                                                            else {
                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, right3, left4, down1, up2])

}}}}}}}}}}}}}}
        return ClusterModel(
            wordId: wordId,
            outerStart: [],
            patternHorizontal: [.trailing, .leading, .trailing, .leading],
            patternVertical: [.trailing, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }

}
