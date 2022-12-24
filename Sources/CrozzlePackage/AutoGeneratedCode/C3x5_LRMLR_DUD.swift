public class C3x5_LRMLR_DUD {
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

                                    for right2 in 0..<wordCount {

                                        if (W.Len[right2] >= interlockWidth &&
                                            W.Start[right2][0] == W.Start[down1][1] &&
                                            W.Start[right2][1] == W.End[up2][3] &&
                                            W.Id[right2] != W.Id[up2] &&
                                            W.Id[right2] != W.Id[left1] &&
                                            W.Id[right2] != W.Id[down1]) {
                                            //print("right2:\(W.Start[right2])")

                                            for down3 in 0..<wordCount {

                                                if (W.Len[down3] >= interlockHeight &&
                                                    W.Start[down3][0] == W.End[left1][0] &&
                                                    W.Start[down3][1] == W.Start[right2][2] &&
                                                    W.Id[down3] != W.Id[right2] &&
                                                    W.Id[down3] != W.Id[up2] &&
                                                    W.Id[down3] != W.Id[left1] &&
                                                    W.Id[down3] != W.Id[down1]) {
                                                    //print("down3:\(W.Start[down3])")

                                                    for middlex3 in 0..<wordCount {

                                                        if (W.Len[middlex3] == interlockWidth &&
                                                            W.Start[middlex3][0] == W.Start[down1][2] &&
                                                            W.Start[middlex3][1] == W.End[up2][2] &&
                                                            W.Start[middlex3][2] == W.Start[down3][2] &&
                                                            W.Id[middlex3] != W.Id[down3] &&
                                                            W.Id[middlex3] != W.Id[right2] &&
                                                            W.Id[middlex3] != W.Id[up2] &&
                                                            W.Id[middlex3] != W.Id[left1] &&
                                                            W.Id[middlex3] != W.Id[down1]) {
                                                            //print("middlex3:\(W.Start[middlex3])")

                                                            for left4 in 0..<wordCount {

                                                                if (W.Len[left4] >= interlockWidth &&
                                                                    W.End[left4][2] == W.Start[down1][3] &&
                                                                    W.End[left4][1] == W.End[up2][1] &&
                                                                    W.End[left4][0] == W.Start[down3][3] &&
                                                                    W.Id[left4] != W.Id[middlex3] &&
                                                                    W.Id[left4] != W.Id[down3] &&
                                                                    W.Id[left4] != W.Id[right2] &&
                                                                    W.Id[left4] != W.Id[up2] &&
                                                                    W.Id[left4] != W.Id[left1] &&
                                                                    W.Id[left4] != W.Id[down1]) {
                                                                    //print("left4:\(W.Start[left4])")

                                                                    for right5 in 0..<wordCount {

                                                                        if (W.Len[right5] >= interlockWidth &&
                                                                            W.Start[right5][0] == W.Start[down1][4] &&
                                                                            W.Start[right5][1] == W.End[up2][0] &&
                                                                            W.Start[right5][2] == W.Start[down3][4] &&
                                                                            W.Id[right5] != W.Id[left4] &&
                                                                            W.Id[right5] != W.Id[middlex3] &&
                                                                            W.Id[right5] != W.Id[down3] &&
                                                                            W.Id[right5] != W.Id[right2] &&
                                                                            W.Id[right5] != W.Id[up2] &&
                                                                            W.Id[right5] != W.Id[left1] &&
                                                                            W.Id[right5] != W.Id[down1]) {
                                                                            //print("right5:\(W.Start[right5])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, middlex3, left4, right5, down1, up2, down3])
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
            patternHorizontal: [.leading, .trailing, .middle, .leading, .trailing],
            patternVertical: [.trailing, .leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}