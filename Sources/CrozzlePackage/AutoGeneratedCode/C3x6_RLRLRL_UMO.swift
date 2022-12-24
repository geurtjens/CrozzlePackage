public class C3x6_RLRLRL_UMO {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.End[up1][5] &&
                            W.Id[right1] != W.Id[up1]) {
                            //print("right1:\(W.Start[right1])")

                            for middley2 in 0..<wordCount {

                                if (W.Len[middley2] == interlockHeight &&
                                    W.Start[middley2][0] == W.Start[right1][1] &&
                                    W.Id[middley2] != W.Id[right1] &&
                                    W.Id[middley2] != W.Id[up1]) {
                                    //print("middley2:\(W.Start[middley2])")

                                    for left2 in 0..<wordCount {

                                        if (W.Len[left2] >= interlockWidth &&
                                            W.End[left2][2] == W.End[up1][4] &&
                                            W.End[left2][1] == W.Start[middley2][1] &&
                                            W.Id[left2] != W.Id[middley2] &&
                                            W.Id[left2] != W.Id[right1] &&
                                            W.Id[left2] != W.Id[up1]) {
                                            //print("left2:\(W.Start[left2])")

                                            for outery3 in 0..<wordCount {

                                                if W.Len[outery3] >= interlockHeight + 2 {

                                                    let outery3Limit = Int(W.Len[outery3]) - Int(interlockHeight)
                                                    for outery3Pos in 1..<outery3Limit {

                                                        if (W.Start[outery3][outery3Pos + 0] == W.Start[right1][2] &&
                                                        W.Start[outery3][outery3Pos + 1] == W.End[left2][0] &&
                                                        W.Id[outery3] != W.Id[left2] &&
                                                        W.Id[outery3] != W.Id[middley2] &&
                                                        W.Id[outery3] != W.Id[right1] &&
                                                        W.Id[outery3] != W.Id[up1]) {
                                                            //print("outery3:\(W.Start[outery3])")

                                                            for right3 in 0..<wordCount {

                                                                if (W.Len[right3] >= interlockWidth &&
                                                                    W.Start[right3][0] == W.End[up1][3] &&
                                                                    W.Start[right3][1] == W.Start[middley2][2] &&
                                                                    W.Start[right3][2] == W.Start[outery3][outery3Pos + 2] &&
                                                                    W.Id[right3] != W.Id[outery3] &&
                                                                    W.Id[right3] != W.Id[left2] &&
                                                                    W.Id[right3] != W.Id[middley2] &&
                                                                    W.Id[right3] != W.Id[right1] &&
                                                                    W.Id[right3] != W.Id[up1]) {
                                                                    //print("right3:\(W.Start[right3])")

                                                                    for left4 in 0..<wordCount {

                                                                        if (W.Len[left4] >= interlockWidth &&
                                                                            W.End[left4][2] == W.End[up1][2] &&
                                                                            W.End[left4][1] == W.Start[middley2][3] &&
                                                                            W.End[left4][0] == W.Start[outery3][outery3Pos + 3] &&
                                                                            W.Id[left4] != W.Id[right3] &&
                                                                            W.Id[left4] != W.Id[outery3] &&
                                                                            W.Id[left4] != W.Id[left2] &&
                                                                            W.Id[left4] != W.Id[middley2] &&
                                                                            W.Id[left4] != W.Id[right1] &&
                                                                            W.Id[left4] != W.Id[up1]) {
                                                                            //print("left4:\(W.Start[left4])")

                                                                            for right5 in 0..<wordCount {

                                                                                if (W.Len[right5] >= interlockWidth &&
                                                                                    W.Start[right5][0] == W.End[up1][1] &&
                                                                                    W.Start[right5][1] == W.Start[middley2][4] &&
                                                                                    W.Start[right5][2] == W.Start[outery3][outery3Pos + 4] &&
                                                                                    W.Id[right5] != W.Id[left4] &&
                                                                                    W.Id[right5] != W.Id[right3] &&
                                                                                    W.Id[right5] != W.Id[outery3] &&
                                                                                    W.Id[right5] != W.Id[left2] &&
                                                                                    W.Id[right5] != W.Id[middley2] &&
                                                                                    W.Id[right5] != W.Id[right1] &&
                                                                                    W.Id[right5] != W.Id[up1]) {
                                                                                    //print("right5:\(W.Start[right5])")

                                                                                    for left6 in 0..<wordCount {

                                                                                        if (W.Len[left6] >= interlockWidth &&
                                                                                            W.End[left6][2] == W.End[up1][0] &&
                                                                                            W.End[left6][1] == W.Start[middley2][5] &&
                                                                                            W.End[left6][0] == W.Start[outery3][outery3Pos + 5] &&
                                                                                            W.Id[left6] != W.Id[right5] &&
                                                                                            W.Id[left6] != W.Id[left4] &&
                                                                                            W.Id[left6] != W.Id[right3] &&
                                                                                            W.Id[left6] != W.Id[outery3] &&
                                                                                            W.Id[left6] != W.Id[left2] &&
                                                                                            W.Id[left6] != W.Id[middley2] &&
                                                                                            W.Id[left6] != W.Id[right1] &&
                                                                                            W.Id[left6] != W.Id[up1]) {
                                                                                            //print("left6:\(W.Start[left6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 8] = UInt8(outery3Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, right3, left4, right5, left6, up1, middley2, outery3])
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing, .leading],
            patternVertical: [.leading, .middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}