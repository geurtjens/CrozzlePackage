public class C3x6_LRLMRL_DMO {
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

            for down1 in 0..<wordCount {

                if (W.Len[down1] >= interlockHeight) {
                    //print("down1:\(W.Start[down1])")

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][2] == W.Start[down1][0] &&
                            W.Id[left1] != W.Id[down1]) {
                            //print("left1:\(W.Start[left1])")

                            for middley2 in 0..<wordCount {

                                if (W.Len[middley2] == interlockHeight &&
                                    W.Start[middley2][0] == W.End[left1][1] &&
                                    W.Id[middley2] != W.Id[left1] &&
                                    W.Id[middley2] != W.Id[down1]) {
                                    //print("middley2:\(W.Start[middley2])")

                                    for right2 in 0..<wordCount {

                                        if (W.Len[right2] >= interlockWidth &&
                                            W.Start[right2][0] == W.Start[down1][1] &&
                                            W.Start[right2][1] == W.Start[middley2][1] &&
                                            W.Id[right2] != W.Id[middley2] &&
                                            W.Id[right2] != W.Id[left1] &&
                                            W.Id[right2] != W.Id[down1]) {
                                            //print("right2:\(W.Start[right2])")

                                            for outery3 in 0..<wordCount {

                                                if W.Len[outery3] >= interlockHeight + 2 {

                                                    let outery3Limit = Int(W.Len[outery3]) - Int(interlockHeight)
                                                    for outery3Pos in 1..<outery3Limit {

                                                        if (W.Start[outery3][outery3Pos + 0] == W.End[left1][0] &&
                                                        W.Start[outery3][outery3Pos + 1] == W.Start[right2][2] &&
                                                        W.Id[outery3] != W.Id[right2] &&
                                                        W.Id[outery3] != W.Id[middley2] &&
                                                        W.Id[outery3] != W.Id[left1] &&
                                                        W.Id[outery3] != W.Id[down1]) {
                                                            //print("outery3:\(W.Start[outery3])")

                                                            for left3 in 0..<wordCount {

                                                                if (W.Len[left3] >= interlockWidth &&
                                                                    W.End[left3][2] == W.Start[down1][2] &&
                                                                    W.End[left3][1] == W.Start[middley2][2] &&
                                                                    W.End[left3][0] == W.Start[outery3][outery3Pos + 2] &&
                                                                    W.Id[left3] != W.Id[outery3] &&
                                                                    W.Id[left3] != W.Id[right2] &&
                                                                    W.Id[left3] != W.Id[middley2] &&
                                                                    W.Id[left3] != W.Id[left1] &&
                                                                    W.Id[left3] != W.Id[down1]) {
                                                                    //print("left3:\(W.Start[left3])")

                                                                    for middlex4 in 0..<wordCount {

                                                                        if (W.Len[middlex4] == interlockWidth &&
                                                                            W.Start[middlex4][0] == W.Start[down1][3] &&
                                                                            W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                            W.Start[middlex4][2] == W.Start[outery3][outery3Pos + 3] &&
                                                                            W.Id[middlex4] != W.Id[left3] &&
                                                                            W.Id[middlex4] != W.Id[outery3] &&
                                                                            W.Id[middlex4] != W.Id[right2] &&
                                                                            W.Id[middlex4] != W.Id[middley2] &&
                                                                            W.Id[middlex4] != W.Id[left1] &&
                                                                            W.Id[middlex4] != W.Id[down1]) {
                                                                            //print("middlex4:\(W.Start[middlex4])")

                                                                            for right5 in 0..<wordCount {

                                                                                if (W.Len[right5] >= interlockWidth &&
                                                                                    W.Start[right5][0] == W.Start[down1][4] &&
                                                                                    W.Start[right5][1] == W.Start[middley2][4] &&
                                                                                    W.Start[right5][2] == W.Start[outery3][outery3Pos + 4] &&
                                                                                    W.Id[right5] != W.Id[middlex4] &&
                                                                                    W.Id[right5] != W.Id[left3] &&
                                                                                    W.Id[right5] != W.Id[outery3] &&
                                                                                    W.Id[right5] != W.Id[right2] &&
                                                                                    W.Id[right5] != W.Id[middley2] &&
                                                                                    W.Id[right5] != W.Id[left1] &&
                                                                                    W.Id[right5] != W.Id[down1]) {
                                                                                    //print("right5:\(W.Start[right5])")

                                                                                    for left6 in 0..<wordCount {

                                                                                        if (W.Len[left6] >= interlockWidth &&
                                                                                            W.End[left6][2] == W.Start[down1][5] &&
                                                                                            W.End[left6][1] == W.Start[middley2][5] &&
                                                                                            W.End[left6][0] == W.Start[outery3][outery3Pos + 5] &&
                                                                                            W.Id[left6] != W.Id[right5] &&
                                                                                            W.Id[left6] != W.Id[middlex4] &&
                                                                                            W.Id[left6] != W.Id[left3] &&
                                                                                            W.Id[left6] != W.Id[outery3] &&
                                                                                            W.Id[left6] != W.Id[right2] &&
                                                                                            W.Id[left6] != W.Id[middley2] &&
                                                                                            W.Id[left6] != W.Id[left1] &&
                                                                                            W.Id[left6] != W.Id[down1]) {
                                                                                            //print("left6:\(W.Start[left6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 8] = UInt8(outery3Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, left3, middlex4, right5, left6, down1, middley2, outery3])
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
            patternHorizontal: [.leading, .trailing, .leading, .middle, .trailing, .leading],
            patternVertical: [.trailing, .middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}