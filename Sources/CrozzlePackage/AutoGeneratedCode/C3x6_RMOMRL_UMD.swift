public class C3x6_RMOMRL_UMD {
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

                                    for middlex2 in 0..<wordCount {

                                        if (W.Len[middlex2] == interlockWidth &&
                                            W.Start[middlex2][0] == W.End[up1][4] &&
                                            W.Start[middlex2][1] == W.Start[middley2][1] &&
                                            W.Id[middlex2] != W.Id[middley2] &&
                                            W.Id[middlex2] != W.Id[right1] &&
                                            W.Id[middlex2] != W.Id[up1]) {
                                            //print("middlex2:\(W.Start[middlex2])")

                                            for down3 in 0..<wordCount {

                                                if (W.Len[down3] >= interlockHeight &&
                                                    W.Start[down3][0] == W.Start[right1][2] &&
                                                    W.Start[down3][1] == W.Start[middlex2][2] &&
                                                    W.Id[down3] != W.Id[middlex2] &&
                                                    W.Id[down3] != W.Id[middley2] &&
                                                    W.Id[down3] != W.Id[right1] &&
                                                    W.Id[down3] != W.Id[up1]) {
                                                    //print("down3:\(W.Start[down3])")

                                                    for outerx3 in 0..<wordCount {

                                                        if W.Len[outerx3] >= interlockWidth + 2 {

                                                            let outerx3Limit = Int(W.Len[outerx3]) - Int(interlockWidth)
                                                            for outerx3Pos in 1..<outerx3Limit {

                                                                if (W.Start[outerx3][outerx3Pos + 0] == W.End[up1][3] &&
                                                                W.Start[outerx3][outerx3Pos + 1] == W.Start[middley2][2] &&
                                                                W.Start[outerx3][outerx3Pos + 2] == W.Start[down3][2] &&
                                                                W.Id[outerx3] != W.Id[down3] &&
                                                                W.Id[outerx3] != W.Id[middlex2] &&
                                                                W.Id[outerx3] != W.Id[middley2] &&
                                                                W.Id[outerx3] != W.Id[right1] &&
                                                                W.Id[outerx3] != W.Id[up1]) {
                                                                    //print("outerx3:\(W.Start[outerx3])")

                                                                    for middlex4 in 0..<wordCount {

                                                                        if (W.Len[middlex4] == interlockWidth &&
                                                                            W.Start[middlex4][0] == W.End[up1][2] &&
                                                                            W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                            W.Start[middlex4][2] == W.Start[down3][3] &&
                                                                            W.Id[middlex4] != W.Id[outerx3] &&
                                                                            W.Id[middlex4] != W.Id[down3] &&
                                                                            W.Id[middlex4] != W.Id[middlex2] &&
                                                                            W.Id[middlex4] != W.Id[middley2] &&
                                                                            W.Id[middlex4] != W.Id[right1] &&
                                                                            W.Id[middlex4] != W.Id[up1]) {
                                                                            //print("middlex4:\(W.Start[middlex4])")

                                                                            for right5 in 0..<wordCount {

                                                                                if (W.Len[right5] >= interlockWidth &&
                                                                                    W.Start[right5][0] == W.End[up1][1] &&
                                                                                    W.Start[right5][1] == W.Start[middley2][4] &&
                                                                                    W.Start[right5][2] == W.Start[down3][4] &&
                                                                                    W.Id[right5] != W.Id[middlex4] &&
                                                                                    W.Id[right5] != W.Id[outerx3] &&
                                                                                    W.Id[right5] != W.Id[down3] &&
                                                                                    W.Id[right5] != W.Id[middlex2] &&
                                                                                    W.Id[right5] != W.Id[middley2] &&
                                                                                    W.Id[right5] != W.Id[right1] &&
                                                                                    W.Id[right5] != W.Id[up1]) {
                                                                                    //print("right5:\(W.Start[right5])")

                                                                                    for left6 in 0..<wordCount {

                                                                                        if (W.Len[left6] >= interlockWidth &&
                                                                                            W.End[left6][2] == W.End[up1][0] &&
                                                                                            W.End[left6][1] == W.Start[middley2][5] &&
                                                                                            W.End[left6][0] == W.Start[down3][5] &&
                                                                                            W.Id[left6] != W.Id[right5] &&
                                                                                            W.Id[left6] != W.Id[middlex4] &&
                                                                                            W.Id[left6] != W.Id[outerx3] &&
                                                                                            W.Id[left6] != W.Id[down3] &&
                                                                                            W.Id[left6] != W.Id[middlex2] &&
                                                                                            W.Id[left6] != W.Id[middley2] &&
                                                                                            W.Id[left6] != W.Id[right1] &&
                                                                                            W.Id[left6] != W.Id[up1]) {
                                                                                            //print("left6:\(W.Start[left6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 2] = UInt8(outerx3Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, middlex2, outerx3, middlex4, right5, left6, up1, middley2, down3])
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
            patternHorizontal: [.trailing, .middle, .outer, .middle, .trailing, .leading],
            patternVertical: [.leading, .middle, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}