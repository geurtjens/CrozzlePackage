public class C3x5_LMRML_DUD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
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

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][2] == W.Start[down1][0] &&
                            W.Id[left1] != W.Id[down1]) {
                            //print("left1:\(W.Start[left1])")

                            for up2 in 0..<wordCount {

                                if (W.Len[up2] >= interlockHeight &&
                                    W.End[up2][4] == W.End[left1][1] &&
                                    W.Id[up2] != W.Id[left1] &&
                                    W.Id[up2] != W.Id[down1]) {
                                    //print("up2:\(W.Start[up2])")

                                    for middlex2 in 0..<wordCount {

                                        if (W.Len[middlex2] == interlockWidth &&
                                            W.Start[middlex2][0] == W.Start[down1][1] &&
                                            W.Start[middlex2][1] == W.End[up2][3] &&
                                            W.Id[middlex2] != W.Id[up2] &&
                                            W.Id[middlex2] != W.Id[left1] &&
                                            W.Id[middlex2] != W.Id[down1]) {
                                            //print("middlex2:\(W.Start[middlex2])")

                                            for down3 in 0..<wordCount {

                                                if (W.Len[down3] >= interlockHeight &&
                                                    W.Start[down3][0] == W.End[left1][0] &&
                                                    W.Start[down3][1] == W.Start[middlex2][2] &&
                                                    W.Id[down3] != W.Id[middlex2] &&
                                                    W.Id[down3] != W.Id[up2] &&
                                                    W.Id[down3] != W.Id[left1] &&
                                                    W.Id[down3] != W.Id[down1]) {
                                                    //print("down3:\(W.Start[down3])")

                                                    for right3 in 0..<wordCount {

                                                        if (W.Len[right3] >= interlockWidth &&
                                                            W.Start[right3][0] == W.Start[down1][2] &&
                                                            W.Start[right3][1] == W.End[up2][2] &&
                                                            W.Start[right3][2] == W.Start[down3][2] &&
                                                            W.Id[right3] != W.Id[down3] &&
                                                            W.Id[right3] != W.Id[middlex2] &&
                                                            W.Id[right3] != W.Id[up2] &&
                                                            W.Id[right3] != W.Id[left1] &&
                                                            W.Id[right3] != W.Id[down1]) {
                                                            //print("right3:\(W.Start[right3])")

                                                            for middlex4 in 0..<wordCount {

                                                                if (W.Len[middlex4] == interlockWidth &&
                                                                    W.Start[middlex4][0] == W.Start[down1][3] &&
                                                                    W.Start[middlex4][1] == W.End[up2][1] &&
                                                                    W.Start[middlex4][2] == W.Start[down3][3] &&
                                                                    W.Id[middlex4] != W.Id[right3] &&
                                                                    W.Id[middlex4] != W.Id[down3] &&
                                                                    W.Id[middlex4] != W.Id[middlex2] &&
                                                                    W.Id[middlex4] != W.Id[up2] &&
                                                                    W.Id[middlex4] != W.Id[left1] &&
                                                                    W.Id[middlex4] != W.Id[down1]) {
                                                                    //print("middlex4:\(W.Start[middlex4])")

                                                                    for left5 in 0..<wordCount {

                                                                        if (W.Len[left5] >= interlockWidth &&
                                                                            W.End[left5][2] == W.Start[down1][4] &&
                                                                            W.End[left5][1] == W.End[up2][0] &&
                                                                            W.End[left5][0] == W.Start[down3][4] &&
                                                                            W.Id[left5] != W.Id[middlex4] &&
                                                                            W.Id[left5] != W.Id[right3] &&
                                                                            W.Id[left5] != W.Id[down3] &&
                                                                            W.Id[left5] != W.Id[middlex2] &&
                                                                            W.Id[left5] != W.Id[up2] &&
                                                                            W.Id[left5] != W.Id[left1] &&
                                                                            W.Id[left5] != W.Id[down1]) {
                                                                            //print("left5:\(W.Start[left5])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, middlex2, right3, middlex4, left5, down1, up2, down3])
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
            outerStart: [],
            patternHorizontal: [.leading, .middle, .trailing, .middle, .leading],
            patternVertical: [.trailing, .leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}