public class C3x6_MOMLRL_DUD {
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

                    for middlex1 in 0..<wordCount {

                        if (W.Len[middlex1] == interlockWidth &&
                            W.Start[middlex1][0] == W.Start[down1][0] &&
                            W.Id[middlex1] != W.Id[down1]) {
                            //print("middlex1:\(W.Start[middlex1])")

                            for up2 in 0..<wordCount {

                                if (W.Len[up2] >= interlockHeight &&
                                    W.End[up2][5] == W.Start[middlex1][1] &&
                                    W.Id[up2] != W.Id[middlex1] &&
                                    W.Id[up2] != W.Id[down1]) {
                                    //print("up2:\(W.Start[up2])")

                                    for outerx2 in 0..<wordCount {

                                        if W.Len[outerx2] >= interlockWidth + 2 {

                                            let outerx2Limit = Int(W.Len[outerx2]) - Int(interlockWidth)
                                            for outerx2Pos in 1..<outerx2Limit {

                                                if (W.Start[outerx2][outerx2Pos + 0] == W.Start[down1][1] &&
                                                W.Start[outerx2][outerx2Pos + 1] == W.End[up2][4] &&
                                                W.Id[outerx2] != W.Id[up2] &&
                                                W.Id[outerx2] != W.Id[middlex1] &&
                                                W.Id[outerx2] != W.Id[down1]) {
                                                    //print("outerx2:\(W.Start[outerx2])")

                                                    for down3 in 0..<wordCount {

                                                        if (W.Len[down3] >= interlockHeight &&
                                                            W.Start[down3][0] == W.Start[middlex1][2] &&
                                                            W.Start[down3][1] == W.Start[outerx2][outerx2Pos + 2] &&
                                                            W.Id[down3] != W.Id[outerx2] &&
                                                            W.Id[down3] != W.Id[up2] &&
                                                            W.Id[down3] != W.Id[middlex1] &&
                                                            W.Id[down3] != W.Id[down1]) {
                                                            //print("down3:\(W.Start[down3])")

                                                            for middlex3 in 0..<wordCount {

                                                                if (W.Len[middlex3] == interlockWidth &&
                                                                    W.Start[middlex3][0] == W.Start[down1][2] &&
                                                                    W.Start[middlex3][1] == W.End[up2][3] &&
                                                                    W.Start[middlex3][2] == W.Start[down3][2] &&
                                                                    W.Id[middlex3] != W.Id[down3] &&
                                                                    W.Id[middlex3] != W.Id[outerx2] &&
                                                                    W.Id[middlex3] != W.Id[up2] &&
                                                                    W.Id[middlex3] != W.Id[middlex1] &&
                                                                    W.Id[middlex3] != W.Id[down1]) {
                                                                    //print("middlex3:\(W.Start[middlex3])")

                                                                    for left4 in 0..<wordCount {

                                                                        if (W.Len[left4] >= interlockWidth &&
                                                                            W.End[left4][2] == W.Start[down1][3] &&
                                                                            W.End[left4][1] == W.End[up2][2] &&
                                                                            W.End[left4][0] == W.Start[down3][3] &&
                                                                            W.Id[left4] != W.Id[middlex3] &&
                                                                            W.Id[left4] != W.Id[down3] &&
                                                                            W.Id[left4] != W.Id[outerx2] &&
                                                                            W.Id[left4] != W.Id[up2] &&
                                                                            W.Id[left4] != W.Id[middlex1] &&
                                                                            W.Id[left4] != W.Id[down1]) {
                                                                            //print("left4:\(W.Start[left4])")

                                                                            for right5 in 0..<wordCount {

                                                                                if (W.Len[right5] >= interlockWidth &&
                                                                                    W.Start[right5][0] == W.Start[down1][4] &&
                                                                                    W.Start[right5][1] == W.End[up2][1] &&
                                                                                    W.Start[right5][2] == W.Start[down3][4] &&
                                                                                    W.Id[right5] != W.Id[left4] &&
                                                                                    W.Id[right5] != W.Id[middlex3] &&
                                                                                    W.Id[right5] != W.Id[down3] &&
                                                                                    W.Id[right5] != W.Id[outerx2] &&
                                                                                    W.Id[right5] != W.Id[up2] &&
                                                                                    W.Id[right5] != W.Id[middlex1] &&
                                                                                    W.Id[right5] != W.Id[down1]) {
                                                                                    //print("right5:\(W.Start[right5])")

                                                                                    for left6 in 0..<wordCount {

                                                                                        if (W.Len[left6] >= interlockWidth &&
                                                                                            W.End[left6][2] == W.Start[down1][5] &&
                                                                                            W.End[left6][1] == W.End[up2][0] &&
                                                                                            W.End[left6][0] == W.Start[down3][5] &&
                                                                                            W.Id[left6] != W.Id[right5] &&
                                                                                            W.Id[left6] != W.Id[left4] &&
                                                                                            W.Id[left6] != W.Id[middlex3] &&
                                                                                            W.Id[left6] != W.Id[down3] &&
                                                                                            W.Id[left6] != W.Id[outerx2] &&
                                                                                            W.Id[left6] != W.Id[up2] &&
                                                                                            W.Id[left6] != W.Id[middlex1] &&
                                                                                            W.Id[left6] != W.Id[down1]) {
                                                                                            //print("left6:\(W.Start[left6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 1] = UInt8(outerx2Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [middlex1, outerx2, middlex3, left4, right5, left6, down1, up2, down3])
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
            patternHorizontal: [.middle, .outer, .middle, .leading, .trailing, .leading],
            patternVertical: [.trailing, .leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}